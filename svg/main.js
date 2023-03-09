const root = document.documentElement;
const frame = document.getElementById('frame');
const t1 = document.getElementById('t1');
const t2 = document.getElementById('t2');
var length = frame.getTotalLength();

frame.style.strokeDasharray = length;
frame.style.strokeDashoffset = length;

// Find scroll percentage on scroll (using cross-browser properties), and offset dash same amount as percentage scrolled
window.addEventListener("scroll", () => {
    var scrollpercent = (document.body.scrollTop + document.documentElement.scrollTop) / (document.documentElement.scrollHeight - document.documentElement.clientHeight);
    var draw = length * scrollpercent;
    frame.style.strokeDashoffset = length - draw;
    frame.style.strokeWidth = 5 * scrollpercent + '%';

    t2.style.opacity = (scrollpercent*2)-1;
    t1.style.opacity = 1-scrollpercent*2;

    root.style.setProperty('--mc',`rgb(${scrollpercent*255},255,${scrollpercent*255})`);
    root.style.setProperty('--bgc',`rgb(${255-scrollpercent*255},255,${255-scrollpercent*255})`);
});