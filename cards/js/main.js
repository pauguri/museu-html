const wrapper = document.querySelector('.wrapper');
const root = document.documentElement;
const values = ['hA','h2','h3','h4','h5','h6','h7','h8','h9','h10','hJ','hQ','hK',
    'dA','d2','d3','d4','d5','d6','d7','d8','d9','d10','dJ','dQ','dK',
    'sA','s2','s3','s4','s5','s6','s7','s8','s9','s10','sJ','sQ','sK',
    'cA','c2','c3','c4','c5','c6','c7','c8','c9','c10','cJ','cQ','cK']

const urlSearchParams = new URLSearchParams(window.location.search);
const cardCount = Object.fromEntries(urlSearchParams.entries())['n'];
createDeck(cardCount);



function createDeck(count){
    root.style.setProperty('--cw',(100/count<=10?10:100/count) + '%');

    for(let i = 0;i<count;i++){
        let card = document.createElement('div');
        card.className = 'card back';
        card.id = i;
        card.setAttribute('onclick','flipCard(this)');
        let reverseNum = document.createElement('div');
        reverseNum.className = 'reverse-number';
        
        let randIndex = Math.floor(Math.random()*values.length);
        let randValue = values[randIndex];
        
        card.classList.add(`${randValue[0]}`)
        card.innerHTML = randValue.slice(1);
        reverseNum.innerHTML = card.innerHTML;
        values.splice(randIndex,1);

        console.log(values);
        
        card.appendChild(reverseNum);
        wrapper.appendChild(card);
    }
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