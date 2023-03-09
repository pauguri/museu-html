const root = document.documentElement;
const values = ['hA','h2','h3','h4','h5','h6','h7','h8','h9','h10','hJ','hQ','hK',
    'dA','d2','d3','d4','d5','d6','d7','d8','d9','d10','dJ','dQ','dK',
    'sA','s2','s3','s4','s5','s6','s7','s8','s9','s10','sJ','sQ','sK',
    'cA','c2','c3','c4','c5','c6','c7','c8','c9','c10','cJ','cQ','cK'];
const boardCols = document.querySelectorAll('.board-column');

function init(){
    let cont = 1;
    console.log(boardCols);
    for(let x = 0; x < boardCols.length; x++){
        for(let y = 0; y < cont; y++){
            createCard(boardCols[x], (cont-1)==y ? true : false, false);
        }
        cont++
    }
}

var currentId = 0;
function createCard(parent,frontUp,posAbs){
    let card = document.createElement('div');
    card.classList.add('card');
    card.classList.add(frontUp ? 'front' : 'back');
    card.style.position = posAbs ? 'absolute' : 'relative';
    let reverseNum = document.createElement('div');
    reverseNum.className = 'reverse-number';
    
    let randIndex = Math.floor(Math.random()*values.length);
    let randValue = values[randIndex];
    
    card.classList.add(`${randValue[0]}`)
    card.innerHTML = randValue.slice(1);
    reverseNum.innerHTML = card.innerHTML;
    values.splice(randIndex,1);

    setAttributes(card, {"id": `${currentId}${randValue[0]}`, "draggable": "true", "ondragstart": "drag(event)", "ondrag": "hide(this)", "ondragend": "show(this)"});
    currentId++;

    card.appendChild(reverseNum);
    parent.appendChild(card);
}

function flipCard(card){
    var cl = card.classList;
    if(!cl.contains('flipout-anim') && !cl.contains('flipin-anim')){
        if(cl.contains('front')){
            cl.add('flipout-anim');
            card.onanimationend = () => {
                cl.remove('front');
                cl.remove('flipout-anim');
                cl.add('flipin-anim');
                cl.add('back');
                card.onanimationend = () => {
                    cl.remove('flipin-anim');
                }
            }
        } else if(cl.contains('back')) {
            cl.add('flipout-anim');
            card.onanimationend = () => {
                cl.remove('back');
                cl.remove('flipout-anim');
                cl.add('flipin-anim');
                cl.add('front');
                card.onanimationend = () => {
                    cl.remove('flipin-anim');
                }
            }
        }
    }   
}

// DRAGEISHON AND DROPEISHON

function allowDrop(ev) {
    ev.preventDefault();
}
function drag(ev) {
    if(ev.target.classList.contains('back')){
        ev.preventDefault();
    } else {
        ev.dataTransfer.setData("text", ev.target.id);
    }
}
function dropGoal(ev) {
    var data = ev.dataTransfer.getData("text");
    // console.log(data);
    let draggedCard = document.getElementById(data);
    if(ev.target.id.slice(-1) == draggedCard.id.slice(-1) && (ev.target.childNodes.length == 0 ? 1 : getCardNum(ev.target.lastChild.innerHTML.split('<')[0]) +1 ) == getCardNum(draggedCard.innerHTML.split('<')[0])){
        ev.preventDefault();
    
        draggedCard.style.position = "absolute";
        if(ev.target.classList.contains('card')){
            ev.target.parentNode.appendChild(draggedCard);
        } else {
            ev.target.appendChild(draggedCard);
        }

        boardCols.forEach(col => {
            try{
                if(col.lastChild.classList.contains('back')){
                    flipCard(col.lastChild);
                }
            } catch (e){
                console.log('Handled ' + e.name);
            }
        });
    }
}
function dropBoard(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    console.log(data);
    document.getElementById(data).style.position = "relative";
    if(ev.target.classList.contains('card')){
        ev.target.parentNode.appendChild(document.getElementById(data));
    } else {
        ev.target.appendChild(document.getElementById(data));
    }

    boardCols.forEach(col => {
        try{
            if(col.lastChild.classList.contains('back')){
                flipCard(col.lastChild);
            }
        } catch (e){
            console.log('Handled ' + e.name);
        }
    });
}
function hide(el){
    el.style.visibility = "hidden";
}
function show(el){
    el.style.visibility = "visible";
}

// UTILS

function setAttributes(el, attrs) {
    for(var key in attrs) {
      el.setAttribute(key, attrs[key]);
    }
}
function getCardNum(str){
    switch(str){
        case 'A':
            return 1;
        case 'J':
            return 11;
        case 'Q':
            return 12;
        case 'K':
            return 13;
        default:
            return parseInt(str);
    }
}