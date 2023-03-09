const tArea = document.querySelector('.touch-area');
const label = document.getElementById('label');
var activeTouches = {};
var colors = [0, 60, 115, 230, 300, 33, 170, 270, 78, 205];

function startTouch(ev) {
    ev.preventDefault();
    let t = ev.targetTouches;
    for (let i = 0; i < t.length; i++) {
        if(!(t[i].identifier in activeTouches)) {
            let x = t[i].clientX;
            let y = t[i].clientY;
            let c = document.createElement('div');
            c.classList.add('target');
            c.style.top = y + 'px';
            c.style.left = x + 'px';
            c.style.setProperty('--col',`hsl(${colors[t[i].identifier]},100%,50%)`);
            c.onanimationend = () => {
                c.setAttribute('data-ready', true);
                trySelectTarget();
            };
            document.body.appendChild(c);
            activeTouches[t[i].identifier] = c;
            console.log('Number of active touches: ' + Object.keys(activeTouches).length + ' (+1)');
        }
    }
}

function moveTouch(ev) {
    let t = ev.changedTouches;
    for (let i = 0; i < t.length; i++) {
        console.log(t[i].identifier + ', top: ' + t[i].clientY + ', left: ' + t[i].clientX);
        activeTouches[t[i].identifier].style.top = t[i].clientY + 'px';
        activeTouches[t[i].identifier].style.left = t[i].clientX + 'px';
    }
}

function endTouch(ev) {
    ev.preventDefault();
    let t = ev.changedTouches;
    for (let i = 0; i < t.length; i++) {
        activeTouches[t[i].identifier].remove();
        delete activeTouches[t[i].identifier];
        console.log('Number of active touches: ' + Object.keys(activeTouches).length + ' (-1)');
    }
    // clear of residual divs
    if(ev.targetTouches.length == 0 && document.querySelectorAll('.target').length > 0){
        activeTouches = {};
        document.querySelectorAll('.target').forEach(div => {
            div.remove();
        })
    }
}

function trySelectTarget() {
    let d = Array.from(document.querySelectorAll('.target'));
    if(d.every(isTargetReady)){

        var possibleIds = [];
        d.forEach(t => {
            possibleIds.push(d.indexOf(t));
        });

        let chosen = [];
        for(let x = 0; x < parseInt(label.innerHTML); x++){
            let rand = Math.floor(Math.random()*possibleIds.length);
            chosen.push(possibleIds[rand]);
            possibleIds.splice(rand,1);
        }

        for(let i = 0; i < d.length; i++){
            d[i].dataset.ready = false;
            if(chosen.includes(i)){
                d[i].style.transform = 'translate(-50%,-50%) scale(1.5)';
            } else {
                d[i].style.opacity = '0';
            }
        }
    }
}

function isTargetReady(t){
    return t.dataset.ready == 'true';
}

function setNumber(toAdd){
    let added = parseInt(label.innerHTML) + toAdd;
    if(added >= 1 && added <= 9) {
        label.innerHTML = added;
    }
}