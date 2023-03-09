var noGyro = false, started = false, tilt = -1, progress = 0, timeElapsed = 0, quadraticA = 0, flipping = false, tiltAngle = 0;
var time = 10; // seconds

function startHourglass() {
    let input = document.getElementById('time-input').value;
    if((!isNaN(input) && input > 0) || input.length == 0){
        setFullScreen();
        setScreenLock();
        document.getElementsByClassName('hidden')[0].classList.remove('hidden');
        document.getElementById('input-container').remove();
        time = input == 0 || input.length == 0 ? 10 : input;
        quadraticA = 860/pow(time,2);
        started = true;
    }
}

function setup() {
    createCanvas(1080, 1920);
    background('black');
    pixelDensity(1);
    document.getElementsByTagName('canvas')[0].style.width = '100%';
    document.getElementsByTagName('canvas')[0].style.height = '100%';

    let inputc = createDiv('');
    inputc.id('input-container');

    inputc.child(createElement('h1','RELLOTGE DE SORRA'));

    let timeInput = createInput('');
    timeInput.attribute('placeholder','10');
    timeInput.attribute('maxlength','3');
    timeInput.id('time-input');
    inputc.child(timeInput);

    inputc.child(createElement('span','s'))
    inputc.child(createElement('br'));

    let btnInput = createButton('Start');
    btnInput.id('start');
    btnInput.mousePressed(startHourglass);
    inputc.child(btnInput);
}

function draw() {
    if(!started){ return };
    noStroke();
    rectMode(CORNER);

    if(!flipping){
        // base triangles
        fill('white');
        rect(100, 100, (1080-200), 860);
        rect(100, (1920-100), (1080-200), -860);

        // flow rectangle
        fill('red');
        rect((1080/2)-4, 1920/2, 8, -tilt*((1920/2)-100))

        timeElapsed = constrain(timeElapsed + deltaTime/1000, 0, time);
        progress = toQuadratic(timeElapsed);

        
        if(tilt == -1){

            rect(100, 1920/2, (1080-200), -map(progress,0,860,860,0));
            rect(100, 1920-100, (1080-200), -progress);
        } else {
            rect(100, 100, (1080-200), progress);
            rect(100, 1920/2, (1080-200), map(progress,0,860,860,0));
        }
    } else {
        // base triangles
        fill('white');
        rect(100, 100, (1080-200), 860);
        rect(100, (1920-100), (1080-200), -860);

        rectMode(CENTER);
        fill('darkred');
        let tE1 = map(timeElapsed,0,time,0,(1920/2)-100);
        let tE2 = map((time-timeElapsed),0,time,0,(1920/2)-100);
        if(tilt == 1){
            rect(1080/2,map(tiltAngle,-45, 45, 530-(((1920/2)-(tE1+100))/2), 530+(((1920/2)-(tE1+100))/2)),1080-200,tE1);
            rect(1080/2,map(tiltAngle,-45, 45, 1390-(((1920/2)-(tE2+100))/2), 1390+(((1920/2)-(tE2+100))/2)),1080-200,tE2);
        } else {
            rect(1080/2,map(tiltAngle,-45, 45, 530-(((1920/2)-(tE2+100))/2), 530+(((1920/2)-(tE2+100))/2)),1080-200,tE2);
            rect(1080/2,map(tiltAngle,-45, 45, 1390-(((1920/2)-(tE1+100))/2), 1390+(((1920/2)-(tE1+100))/2)),1080-200,tE1);
        }
        
    }
    
    // masks
    fill('black');
    triangle(50, 0, 1080/2, 1920/2, 50, 1920);
    triangle(1080-50, 0, 1080/2, 1920/2, 1080-50, 1920);
}

function mouseClicked() {
    if(noGyro && started){
        flipping = true;
        setTimeout(() => {
            tilt = tilt == 1 ? -1 : 1;
            timeElapsed = reflected(timeElapsed);
            flipping = false;
        }, 2000);
        
    }
}

function setFullScreen() {
    let de = document.documentElement;
    if (de.requestFullscreen) { de.requestFullscreen(); }
    else if (de.mozRequestFullScreen) { de.mozRequestFullScreen(); }
    else if (de.webkitRequestFullscreen) { de.webkitRequestFullscreen(); }
    else if (de.msRequestFullscreen) { de.msRequestFullscreen(); }
    screen.orientation.lock('portrait');
}

async function setScreenLock() {
    if('wakeLock' in navigator) {
        let screenLock;
        try {
            screenLock = await navigator.wakeLock.request('screen');
        } catch(err) {
            console.log(err.name, err.message);
        }
    }
}

// GYROSCOPE
if(window.DeviceOrientationEvent){
    window.addEventListener("deviceorientation", function(event) {
        if(event.alpha || event.beta || event.gamma){
            if(event.beta >= 45 && event.beta <= 135) {
                flipping = false;
                if(tilt == 1){
                    tilt = -1;
                    timeElapsed = reflected(timeElapsed);
                }
            } else if(event.beta <= -45 && event.beta >= -135) {
                flipping = false;
                if(tilt == -1){
                    tilt = 1;
                    timeElapsed = reflected(timeElapsed);
                }
            } else {
                if(flipping == false){
                    flipping = true;
                }
                tiltAngle = event.beta;
            }
        } else {
            noGyro = true;
        }
    });
}

// UTILS

let toQuadratic = (x) => {
    // return quadraticA*pow(x,2);
    return map(x,0,time,0,860);
}

let reflected = (n) => {
    return abs(n-time);
}

