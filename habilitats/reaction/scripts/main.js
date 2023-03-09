var isGreen = false;
var valid = true;
var startTime;
var hs = window.localStorage.getItem('react-hs') == null ? 0 : window.localStorage.getItem('react-hs');
const infoText = document.getElementById('info-text');
const tooSoon = document.getElementById('too-soon');

function waitForStart(){
    document.getElementById('hs').innerHTML = hs + 'ms';
}

function startGame(){
    document.querySelector('.title').style.display = 'none';
    document.querySelector('.game').style.display = 'flex';

    setTimeout(() => {
        if(valid){
            isGreen = true;
            document.body.style.backgroundColor = '#3bed2b';
            infoText.innerHTML = 'CLICK!'
            startTime = new Date;
        }
    }, 1000 + Math.random()*5000);
}

function registerClick(){
    if(isGreen && valid){
        var time = new Date - startTime;
        infoText.innerHTML = 'Your reaction time:<br>' + time + 'ms';
        console.log('Reaction time: ' + time + 'ms');
        if(time < hs || hs == 0){
            hs = time;
            document.getElementById('hs').innerHTML = time + 'ms';
            window.localStorage.setItem('react-hs',time);
        }
        tooSoon.innerHTML = 'Click to try again';
        valid = false;
        setTimeout(() => {
        }, 500);
    } else if(valid) {
        valid = false;
        tooSoon.innerHTML = 'Too soon! Click to try again';
    } else {
        window.location = window.location;
    }
}