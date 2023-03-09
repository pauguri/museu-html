const logContainer = document.getElementById('log-container');
const setup = document.getElementById('setup');
const game = document.getElementById('game');
const dayText = document.getElementById('day');
const postgame = document.getElementById('post-game');
var lang = 'ca';
var players = [];
var alivePlayers = [];
var loggedPlayers = [];

function init() {
    let urlSearchParams = new URLSearchParams(window.location.search);
    let query = Object.fromEntries(urlSearchParams.entries())['lang'];
    if(query !== undefined && query !== null) {
        lang = query;
    }
    document.title = SM[lang].PAGE_TITLE;
    document.getElementById('lang-select').value = lang;
    document.getElementById('title').innerHTML = SM[lang].TITLE;
    document.getElementById('tribute-number').innerHTML = SM[lang].TRIBUTE_COUNT;
    document.getElementById('instructions').innerHTML = SM[lang].INSTRUCTIONS;
    document.getElementById('age-warning').innerHTML = SM[lang].AGE_WARNING;
    document.getElementById('start-btn').innerHTML = SM[lang].START_BUTTON;
    document.getElementById('next-btn').innerHTML = SM[lang].NEXT_BUTTON;
    document.getElementById('restart-btn').innerHTML = SM[lang].RESTART_BUTTON;
    setPlayerCount(24)
}

function setPlayerCount(count){
    let inputWrapper = document.getElementById('input-wrapper');
    inputWrapper.innerHTML = '';
    count = count.length <= 0 ? 24 : count < 2 ? 2 : count; 

    for(let i = 0, j = 1; i < count; i++, j += 0.5){
        let input = document.createElement('input');
        input.id = 'i' + i;
        input.type = 'text';
        input.maxlength = '20';
        input.dataset.district = Math.floor(j);
        input.placeholder = SM[lang][i%2 == 0 ? 'MALE_NAME' : 'FEMALE_NAME'].replace('$n',input.dataset.district);
        inputWrapper.appendChild(input);
    }
}

function setPlayers(form) {
    for (var i = 0; i < form.elements.length - 2; i++) {
        let playername;
        if(form.elements[i].value.length == 0){
            playername = form.elements[i].placeholder;
        } else {
            playername = form.elements[i].value;
        }
        players.push(new Player(playername,form.elements[i].dataset.district));
    }
    alivePlayers = Array.from(players);

    setup.remove();
    game.style.display = '';
    advanceDay();    
}

var day = 0;
function advanceDay(button) {
    logContainer.innerHTML = '';
    loggedPlayers = [];
    day++;
    dayText.innerHTML = SM[lang].DAY + day;
    window.scrollTo(0,0);
    players = shuffle(players);
    players.forEach((p) => {
        if(p.deceased || alivePlayers.length == 1){ return; }

        if(p.tryForEvents(alivePlayers)) {
            let index = alivePlayers.indexOf(p);
            let targetPlayers = alivePlayers.slice(0, index).concat(alivePlayers.slice(index + 1));
            let chosenPlayer = targetPlayers[Math.floor(Math.random()*targetPlayers.length)];
            Player.kill(p, chosenPlayer);
        }
        p.tryToEat();
        p.executeStates();
        if(!loggedPlayers.includes(p)){
            loggedPlayers.push(p);
        }
    })
    loggedPlayers.forEach((p) => {
        let stateDivs = '';
        if(p.deceased){
            stateDivs = `<div class="state" style="background: #ff0000">${SM[lang].STATES.deceased}</div>`;
        } else {
            for(let state in p.states){
                if(p.states[state]){
                    stateDivs += `<div class="state" style="background: ${Player.stateColors[state]}">${SM[lang].STATES[state]}</div>`;
                }
            }
        }

        let vitalColors = {};
        for(let key in p.previousVitals){
            if(p.previousVitals[key] > p[key]){
                vitalColors[key] = 'gray';
            } else if(p.previousVitals[key] < p[key]){
                vitalColors[key] = 'yellow';
            }
        }
        
        logContainer.innerHTML += `
            <div class="log-box" ${p.deceased ? 'style=" background: #493030"' : p.dropSent ? 'style=" background: #315236"' : ''}>
                <div class="top-bar"><div class="name-container"><div class="name">${p.name}</div>${stateDivs}</div>${p.deceased ? '' : `<button class="drop-btn" onclick="sendDrop('${p.name}',this)"><i class="fas fa-parachute-box"></i></button>`}</div>
                <div class="event">${p.eventText}</div>
                <div class="stats-title" onclick="expand(this)">${SM[lang].VITALS}<img src="./img/arrow.png" width="18" height="10"></div>
                <div class="vitals-container">
                    <div class="single-stat">
                        <div class="vital-title">${SM[lang].HUNGER}</div><div class="vital-slider"><div style="--percent: ${Math.min(p.hunger, p.previousVitals.hunger)*100}%; background: #ff7b00"></div><div style="--percent: ${Math.abs(p.previousVitals.hunger - p.hunger)*100}%; background: ${vitalColors.hunger}"></div></div>
                    </div>
                    <div class="single-stat">
                        <div class="vital-title">${SM[lang].STRENGTH}</div><div class="vital-slider"><div style="--percent: ${Math.min(p.strength, p.previousVitals.strength)*100}%; background: #ff7b00"></div><div style="--percent: ${Math.abs(p.previousVitals.strength - p.strength)*100}%; background: ${vitalColors.strength}"></div></div>
                    </div>
                    <div class="single-stat">
                        <div class="vital-title">${SM[lang].SANITY}</div><div class="vital-slider"><div style="--percent: ${Math.min(p.sanity, p.previousVitals.sanity)*100}%; background: #ff7b00"></div><div style="--percent: ${Math.abs(p.previousVitals.sanity - p.sanity)*100}%; background: ${vitalColors.sanity}"></div></div>
                    </div>
                    <div class="single-stat">
                        <div class="vital-title">${SM[lang].MOOD}</div><div class="vital-slider"><div style="--percent: ${Math.min(p.mood, p.previousVitals.mood)*100}%; background: #ff7b00"></div><div style="--percent: ${Math.abs(p.previousVitals.mood - p.mood)*100}%; background: ${vitalColors.mood}"></div></div>
                    </div>
                </div>
                <div class="stats-title" onclick="expand(this)">${SM[lang].INVENTORY}<img class="collapsed-arrow" src="./img/arrow.png" width="18" height="10"></div>
                <div class="items-container collapsed">
                    ${p.food > 0 ? `<div class="single-item">${SM[lang].FOOD} x${p.food} ${p.food != p.previousItems.food ? '<span style="color:#ff7b00">(' + (p.food - p.previousItems.food > 0 ? '+' : '') + (p.food - p.previousItems.food) + ')</span>' : ''}</div>` : ''}
                    ${p.weapon > 0 ? `<div class="single-item">${SM[lang].WEAPONS} x${p.weapon} ${p.weapon != p.previousItems.weapon ? '<span style="color:#ff7b00">(' + (p.weapon - p.previousItems.weapon > 0 ? '+' : '') + (p.weapon - p.previousItems.weapon) + ')</span>' : ''}</div>` : ''}
                    ${p.medicine > 0 ? `<div class="single-item">${SM[lang].MEDICINE} x${p.medicine} ${p.medicine != p.previousItems.medicine ? '<span style="color:#ff7b00">(' + (p.medicine - p.previousItems.medicine > 0 ? '+' : '') + (p.medicine - p.previousItems.medicine) + ')</span>' : ''}</div>` : ''}
                </div>
            </div>`;
        p.dayEnd();
    })

    if(alivePlayers.length == 1) {
        button.innerHTML = SM[lang].WINNER_BUTTON;
        button.setAttribute('onclick','endGame()');
    }
}

function sendDrop(playername,btn){
    for(let i = 0; i < players.length; i++){
        if(players[i].name == playername){
            players[i].dropSent = true;
            break;
        }
    }
    btn.innerHTML = '<i class="fas fa-check"></i>';
    btn.disabled = true;
}

function endGame() {
    let p = alivePlayers[0];
    document.getElementById('winner-name').innerHTML = p.name;
    document.getElementById('winner-text').innerHTML = SM[lang].WINNER;
    document.getElementById('winner-stats').innerHTML = `
        <div class="stats-title center" onclick="expand(this)">${SM[lang].VITALS}<img class="collapsed-arrow" src="./img/arrow.png" width="18" height="10"></div>
        <div class="vitals-container collapsed">
            <div class="single-stat">
                <div class="vital-title">${SM[lang].HUNGER}</div><div class="vital-slider"><div style="--percent: ${p.hunger*100}%; background: #ff7b00"></div></div>
            </div>
            <div class="single-stat">
                <div class="vital-title">${SM[lang].STRENGTH}</div><div class="vital-slider"><div style="--percent: ${p.strength*100}%; background: #ff7b00"></div></div>
            </div>
            <div class="single-stat">
                <div class="vital-title">${SM[lang].SANITY}</div><div class="vital-slider"><div style="--percent: ${p.sanity*100}%; background: #ff7b00"></div></div>
            </div>
            <div class="single-stat">
                <div class="vital-title">${SM[lang].MOOD}</div><div class="vital-slider"><div style="--percent: ${p.mood*100}%; background: #ff7b00"></div></div>
            </div>
        </div>
        <div class="stats-title center" onclick="expand(this)">${SM[lang].INVENTORY}<img class="collapsed-arrow" src="./img/arrow.png" width="18" height="10"></div>
        <div class="items-container collapsed">
            ${p.food > 0 ? `<div class="single-item">${SM[lang].FOOD} x${p.food}</div>` : ''}
            ${p.weapon > 0 ? `<div class="single-item">${SM[lang].WEAPONS} x${p.weapon}</div>` : ''}
            ${p.medicine > 0 ? `<div class="single-item">${SM[lang].MEDICINE} x${p.medicine}</div>` : ''}
        </div>
    `;
    game.remove();
    postgame.style.display = '';
}

// UI

function expand(element){
    element.querySelector('img').classList.toggle('collapsed-arrow');
    let content = element.nextElementSibling || element.nextSibling;
    content.classList.toggle('collapsed');
}

// UTILS

let clamp = (num) => Math.min(Math.max(num, 0), 1);

function shuffle(array) {
    var m = array.length, t, i;
  
    // While there remain elements to shuffle…
    while (m) {
  
      // Pick a remaining element…
      i = Math.floor(Math.random() * m--);
  
      // And swap it with the current element.
      t = array[m];
      array[m] = array[i];
      array[i] = t;
    }
  
    return array;
  }