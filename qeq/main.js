const imgs = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47];
const board = document.querySelector('.board');
var correctId;

function init(){
    for(let i = 0; i < 24; i++){
        let img = document.createElement("img");
        let randIndex = Math.floor(Math.random()*imgs.length);
        img.src = `./img/${imgs[randIndex]}.jpeg`;
        img.id = imgs[randIndex];
        img.setAttribute("onclick",'clickCard(this)');
        board.appendChild(img);
        imgs.splice(randIndex, 1);
    }

    correctId = board.childNodes[Math.floor(Math.random()*board.childNodes.length)].id;
    document.getElementById('card-image').src = `./img/${correctId}.jpeg`;
}

function clickCard(c){
    c.classList.toggle('cross');
    var crossedImgs = document.querySelectorAll('.cross');
    var allImgs = board.childNodes;
    if(crossedImgs.length >= 23){
        document.querySelector('.card').style.bottom = '-20px';
        allImgs.forEach((i) => {
            i.style.pointerEvents = 'none';
        })
        setTimeout(() => {
            if(board.querySelector('img:not(.cross)').id == correctId){
                alert("CORRECT! uwu");
            } else {
                alert("NOPE! owo");
            }
        }, 500);
    }
}