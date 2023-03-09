var cont = 0;
var pieces;
const root = document.documentElement;
var startTime;

function initialize(){
    // get params
    var urlSearchParams = new URLSearchParams(window.location.search);
    var params = Object.fromEntries(urlSearchParams.entries());
    // set piece size
    var pieceSize = 400 / params['n']
    root.style.setProperty('--ps',pieceSize + 'px');
    // create dropable & dragable
    var ids = [];

    for(let i = 0; i<Math.pow(params['n'],2); i++){
        let drdiv = document.createElement('div');
        setAttributes(drdiv, {"id": "dr" + i, "class": "dropable", "ondrop": "drop(event)", "ondragover": "allowDrop(event)"});
        document.querySelector('.wrapper').appendChild(drdiv);

        let dgdiv = document.createElement('div');
        setAttributes(dgdiv, {"class": "dragable", "draggable": "true", "ondragstart": "drag(event)", "ondrag": "hide(this)", "ondragend": "show(this)"});
        document.querySelector('.pieces').appendChild(dgdiv);

        ids.push('dg' + i);
    }
    pieces = document.getElementsByClassName('dragable');
    // set image
    document.querySelectorAll('.dragable').forEach((e) => {
        e.style.backgroundImage = 'url(' + params['imgp'] + ')';
    });
    // set random ids
    for(let i = 0; i<pieces.length; i++){
        var rand = Math.floor(Math.random()*ids.length);
        pieces[i].id = ids[rand];
        ids.splice(rand,1);
    }
    // set image positions
    switch(pieces.length){
        case 4:
            for(let i = 0; i<pieces.length; i++){
                var bini = ('0' + i.toString(2)).slice(-2);
                document.getElementById('dg' + i).style.backgroundPosition = `${200*bini.charAt(1)}px ${200*bini.charAt(0)}px`;
            }
            break;
        case 9:
    }

    // start timer
    startTime = new Date;
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    if(ev.target.classList.contains('locked')){
        ev.preventDefault();
    } else {
        ev.dataTransfer.setData("text", ev.target.id);
    }
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    
    if(!ev.target.classList.contains('dragable')){
        console.log(data);
        ev.target.appendChild(document.getElementById(data));

        if(data.charAt(2) == ev.target.id.charAt(2)){
            document.getElementById(data).classList.add('locked');

            cont++;
            console.log(cont);
            if(cont >= pieces.length){
                var timeElapsed = (new Date - startTime) / 1000;
                setTimeout(() => {
                    alert('Has tardat ' + timeElapsed + 's');
                }, 50);
            }
        }
    }
    
}

function hide(el){
    el.style.visibility = "hidden";
}

function show(el){
    el.style.visibility = "visible";
}

function setAttributes(el, attrs) {
    for(var key in attrs) {
      el.setAttribute(key, attrs[key]);
    }
  }