var inInches, k, enabled = false;
const bgText = document.getElementById('bg-text');
const start = document.getElementById('start-container');
const main = document.getElementById('main-container');

// SETUP

function checkStorage() {
    let storedK = window.localStorage.getItem('ruler-k');
    let storedUnit = window.localStorage.getItem('ruler-unit');
    if(storedK == null || storedUnit == null) {
        start.style.display = '';
    } else {
        k = storedK;
        inInches = storedUnit;
        start.remove();
        main.style.display = '';
        enabled = true;
    }
}

function setSize(form) {
    let inputs = form.elements;
    inInches = inputs[2].value;
    k = parseFloat(inputs[0].value + '.' + inputs[1].value) / 200;
    window.localStorage.setItem('ruler-k',k);
    window.localStorage.setItem('ruler-unit',inInches);
    console.log('Screen proportion: ' + k);

    start.remove();
    main.style.display = '';
    enabled = true;
}

function recalibrate() {
    window.localStorage.removeItem('ruler-k');
    window.localStorage.removeItem('ruler-unit');
    window.location.reload();
}

// P5

function setup() {
    let canvas = createCanvas(windowWidth, windowHeight);
    canvas.parent(main);
    pixelDensity(1);
}

var clickCount = 0, lastClick = [];
function mouseClicked(event) {
    if(!enabled) { return; }

    clickCount++;
    background(255);

    if(clickCount >= 2) {
        stroke(0);
        strokeWeight(10);
        line(lastClick[0],lastClick[1],event.clientX,event.clientY);

        let distance = round(k*sqrt(pow(event.clientX-lastClick[0],2)+pow(event.clientY-lastClick[1],2)),2); 
        let midpoint = [(event.clientX+lastClick[0])/2,(event.clientY+lastClick[1])/2];
        let angle = atan((event.clientY-lastClick[1])/(event.clientX-lastClick[0]));

        push();
        translate(lastClick[0],lastClick[1]);
        rotate(angle+PI);
        line(0,-30,0,30);
        pop();
        push();
        translate(event.clientX,event.clientY);
        rotate(angle+PI);
        line(0,-30,0,30);
        pop();

        strokeWeight(0);
        fill(255,0,0);
        textAlign(CENTER);
        textStyle(BOLD);
        textSize(25);
        push();
        translate(midpoint[0], midpoint[1]);
        rotate(angle);
        text(distance + (inInches == 'true' ? 'in' : 'cm'),0,-30);
        pop();

        bgText.innerHTML = 'Tap anywhere to set first point';
        clickCount = 0;
        lastClick = [];
    } else {
        fill(0);
        circle(event.clientX,event.clientY,20);

        lastClick = [event.clientX,event.clientY];
        bgText.innerHTML = 'Tap anywhere to set second point';
    }
    
}
function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}