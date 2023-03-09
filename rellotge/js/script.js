const hh = document.querySelector("#h");
const mh = document.querySelector("#m");
const sh = document.querySelector("#s");
const bgc = document.querySelector("#bgc");
const h1c = document.querySelector("#h1c");
const h2c = document.querySelector("#h2c");
const root = document.documentElement;
var lastSec = -1;
var secChanged = false;

setInterval(() => {
    var time = new Date();
    var hr = time.getHours();
    var min = time.getMinutes();
    var sec = time.getSeconds();
    
    console.log(`${hr}:${min}:${sec}`);

    hh.style.transform = `rotateZ(${hr*30+min/2}deg)`;
    mh.style.transform = `rotateZ(${min*6+sec*0.1}deg)`;
    sh.style.transform = `rotateZ(${sec*6}deg)`;

    root.style.setProperty('--bg-c', bgc.value);
    root.style.setProperty('--h1-c', h1c.value);
    root.style.setProperty('--h2-c', h2c.value);s

});

