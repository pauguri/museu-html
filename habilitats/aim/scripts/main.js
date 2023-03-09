
var hs = window.localStorage.getItem('aim-hs') == null ? 0 : window.localStorage.getItem('aim-hs');
const infoText = document.getElementById('info-text');
const infoSub = document.getElementById('info-sub');
const target = document.getElementById('target');
var targetsHit = 30;
var accuracyArray = [];
var timeArray = [];
var ended = false;
var startTime;

function waitForStart(){
    document.getElementById('hs').innerHTML = hs;
}

function startGame(){
    document.querySelector('.title').style.display = 'none';
    document.querySelector('.game').style.display = 'flex';

    target.style.display = 'block';
    infoText.style.opacity = 0.5;
    startTime = new Date;
    spawnTarget();
}

function clickTarget(value){
    timeArray.push(new Date - startTime);
    console.log(timeArray);
    targetsHit--;
    accuracyArray.push(value);
    if(targetsHit<=0){
        infoText.style.opacity = 1;
        target.style.display = 'none';
        let compTime = getAverage(timeArray);
        let compAccur = getAverage(accuracyArray);
        let score = Math.round((1/compTime)*(compAccur*100000))/100;
        if(hs < score){
            hs = score;
            document.getElementById('hs').innerHTML = score;
            window.localStorage.setItem('aim-hs',score);
        }
        infoText.innerHTML = `Average time per target:<br>${compTime}ms<br>Accuracy:<br>${compAccur}%<br>SCORE:<br>${score}`;

        setTimeout(() => {
            ended = true;
            infoSub.innerHTML = 'Click to try again';
        }, 1500);
        
    } else {
        infoText.innerHTML = targetsHit;
        spawnTarget();
        startTime = new Date;
    }
}

function spawnTarget(){
    
    target.style.setProperty('left',Math.floor(Math.random()*(window.innerWidth-100)) + 'px');
    target.style.setProperty('top',Math.floor(Math.random()*(window.innerHeight-100)) + 'px');
}

function registerMissClick(){
    if(!ended){
        accuracyArray.push(0);
    } else {
        window.location = window.location;
    }
}

function getAverage(array){
    let average = 0;
    array.forEach(n => {
        average += n;
    });
    return Math.round((average / array.length)*100)/100;
}