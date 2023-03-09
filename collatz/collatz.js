var inp, startNum = 0, maxNum, step = 0, stepLength, w, r, lastPos = [];
const inputContainer = document.getElementById('input-container');
var heights = [], traceNums = [];

function setup() {
    createCanvas(1280, 720);
    background('black');

    let inputc = createDiv(`Escriu un numero per veure la seva <span class="help" title="Per cada n parell, s'aplica n/2. Per cada n imparell, s'aplica 3n+1.">Conjectura de Collatz</span>: `);
    inputc.id('input-container');

    inp = createInput('27');
    inp.size(80,20);
    inputc.child(inp);
    let btn = createButton('OK');
    btn.mousePressed(setNumber);
    inputc.child(btn);
}

function setNumber() {
    startNum = Number(inp.value());

    if(startNum > 0 && Number.isInteger(startNum)){
        background('black');
        heights = [];
        step = 0;
        max = 0;
        traceNums.forEach(d => {
            d.remove();
        });

        let currentNum = startNum;
        while(currentNum > 1){
            heights.push(currentNum);

            if(currentNum%2 == 0){ // COLLATZ thingy
                currentNum = currentNum/2;
            } else {
                currentNum = (currentNum*3)+1;
            }
        }
        heights.push(currentNum);
        maxNum = Math.max.apply(null, heights);
        stepLength = 1270 / (heights.length);
        r = constrain(stepLength,1,20);
        w = constrain(stepLength/4,1,5);

        console.log(heights);
    } else {
        alert('Escriu un numero natural (enter positiu)');
    }
}

function draw() {
    if(startNum > 0 && step <=  heights.length){
        let x = 10 + step*stepLength;
        let y = 720 - map(heights[step], 1, maxNum, r/2, 710-(r/2));

        stroke(255); // render shapes
        strokeWeight(w);
        line(lastPos[0], lastPos[1], x, y);
        fill(255);
        noStroke();
        ellipse(x, y, r, r);
        traceNums.push(createDiv(heights[step]));
        if(heights[step] == maxNum){
            textSize(20);
            fill('red');
            text(maxNum,x+r,y+(r/2));
            traceNums.at(-1).style('color','red');
        } else if(heights[step]%2 == 0) {
            traceNums.at(-1).style('color','blue');
        } else {
            traceNums.at(-1).style('color','green');
        }

        fill(0);
        rect(1150,10,130,30);
        fill(255);
        textSize(20);
        text('passos: ' + step, 1150,30);

        lastPos = [x, y];
        step++;
    }
}