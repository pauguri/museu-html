const cursor = document.getElementById("cursor");
const cursorText = document.getElementById("cursor-text");
const colorCells = document.getElementsByClassName("color-cell");
const timerDiv = document.getElementById("timer");
var score = 0;
var startTime = 200, timer = 200;
var colorTexts = ["RED","BLUE","GREEN","YELLOW","ORANGE","PINK"];
var colors = ["red","blue","green","yellow","orange","palevioletred"];

window.addEventListener("mousemove",(e) => {
    cursor.style.left = e.clientX + "px";
    cursor.style.top = e.clientY + "px";
});

function init() {
    score = 0;
    setupRound();
}

function setupRound(){
    timer = startTime;
    randomizeBG();
    cursorText.innerHTML = colorTexts[Math.floor(Math.random()*colorTexts.length)];
    cursorText.style.color = colors[Math.floor(Math.random()*colors.length)];
}

function randomizeBG(){
    let indexs = [0,1,2,3,4,5];
    for(let i = 0; i < colorCells.length; i++) {
        let randomIndex = Math.floor(Math.random() * indexs.length);
        let chosenIndex = indexs[randomIndex];
        colorCells[i].style.backgroundColor = colors[chosenIndex];
        colorCells[i].dataset.color = colorTexts[chosenIndex];
        indexs.splice(randomIndex,1);
    }
}

function submitColor(cell){
    console.log(cursorText.innerHTML + " " + cell.dataset.color);
    if(cursorText.innerHTML == cell.dataset.color){
        timerDiv.classList.remove("timer-correct");
        setTimeout(() => {
            timerDiv.classList.add("timer-correct");
        }, 5);
        score++;
        startTime *= 0.95;
        setupRound();
    } else {
        timer -= (startTime/4);
        randomizeBG();
    }
}

function timerTick() {
    timer--;
    timerDiv.style.width = (timer/startTime) <= 0 ? 0 : (timer/startTime)*100 + "%";
    if(timer <= 0){
        setTimeout(() => {
            alert("GAME OVER" + "\nscore: " + score);
            window.location.reload();
        }, 10);
    } else {
        window.requestAnimationFrame(timerTick);
    }
}
window.requestAnimationFrame(timerTick);