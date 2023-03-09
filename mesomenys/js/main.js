import { CountUp } from './countUp.min.js';

/* MÉS O MENYS
Creat per Pau Guri (@ElPauX a Twitter)
Amb fonts de Google Fonts, icones de FontAwesome i la llibreria CountUp de inorganik (https://github.com/inorganik/CountUp.js)
*/

var munDatabase = {}, munWorking;
var chosenCom, canLeave = true;
const loadingCover = document.querySelector('.loading');
const refMunDOM = [
    document.querySelector('.ref .mun-title'),
    document.querySelector('.ref .com-title'),
    document.querySelector('.ref .mun-count'),
    document.querySelector('.ref .mun-date'),
    document.querySelector('.ref .background'),
];
const nextMunDOM = [
    document.querySelector('.next .mun-title'),
    document.querySelector('.next .com-title'),
    document.querySelector('.next .mun-count'),
    document.querySelector('.next .mun-date'),
    document.querySelector('.next .background'),
];
const startComSelect = document.getElementById('com-select');
const startComSubmit = document.querySelector('#com-select-submit span');
const nextMunContDesc = document.querySelector('.next .mun-count-desc');
const inputArea = document.querySelector('.input-area');
const score = document.querySelector('#score-num');
const hs = document.querySelector('.hs');
const hsList = document.querySelector('.hs-list');
var storedHs, storedComHs;
const resultsScore = document.querySelector('.r-score-text');
const resultsHS = document.querySelector('.r-hs-text');
var newRecord = false;
const newRecordDiv = document.querySelector('.new-record');

document.addEventListener('DOMContentLoaded', loadJSON);
window.onbeforeunload = function(){
    console.log(canLeave);
    if(!canLeave){
        return 'Estàs segur/a que vols sortir?';
    }
  };

function loadJSON() {

    console.log('Creat per Pau Guri. Inspirat en The Higher Lower Game (https://www.higherlowergame.com/).');

    fetch(window.location + 'js/comarques.csv')
        .then(response => response.text())
        .then(data => {
            let comArr = data.split(',');
            comArr.forEach(com => {
                let o = document.createElement('option');
                o.innerHTML = com;
                o.value = com;
                startComSelect.appendChild(o);
            })

            fetch(window.location + 'js/data-filter.json')
                .then(response => response.json())
                .then(data => {
                    munDatabase = data;
                    console.log('Nombre de municipis: ' + getObjectLength(munDatabase));

                    startComSelect.addEventListener('input', (event) => {
                        if(event.target.value == '0'){
                            startComSubmit.parentNode.style.display = 'none';
                            startComSelect.classList.remove('chosen');
                        } else {
                            startComSubmit.innerHTML = event.target.value + ' - ' + munDatabase[event.target.value].length;
                            startComSubmit.parentNode.style.display = 'block';
                            startComSelect.classList.add('chosen');
                        }
                        
                    })

                    for(let i = 1; i <= 2; i++){
                        let keys = Object.keys(munDatabase);
                        let randomCom = munDatabase[keys[ keys.length * Math.random() << 0]];
                        document.getElementById(`sm${i}`).innerHTML = randomCom[Math.floor(Math.random()*randomCom.length)][0];
                    }
                    
                    if(document.querySelector('button[disabled]') != null){
                        document.querySelector('button[disabled]').removeAttribute('disabled');
                    }
                    startComSelect.removeAttribute('disabled');

                    storedComHs = window.localStorage.getItem('mun-com-hs');
                    if(storedComHs == null || storedComHs == undefined){
                        storedComHs = {};
                    } else {
                        storedComHs = JSON.parse(storedComHs);
                    }
                    storedHs = window.localStorage.getItem('mun-hs');
                        if(storedHs == null || storedHs == undefined){
                            storedHs = 0;
                            window.localStorage.setItem('mun-hs',0);
                        }
                    saveLocalStorage();

                    hsList.innerHTML += '<p>Tot Catalunya:&emsp;<span>' + storedHs + '</span></p>';
                    for(let k in storedComHs){
                        hsList.innerHTML += k + ':&emsp;<span>' + storedComHs[k] + ' / ' + munDatabase[k].length + '</span><br>';
                    }
                })
        })
}

function handleStart(isWholeObject,chosenKey){
    chosenCom = isWholeObject ? '0' : chosenKey;
    document.querySelector('.start-wrapper').classList.remove('visible');
    loadingCover.remove();
    startGame();
}

function startGame(){
    canLeave = false;
    fillWorkingArray();
    score.innerHTML = chosenCom == '0' ? '0' : '1';
    if(chosenCom != '0'){
        document.getElementById('score-fraction').innerHTML = ' / ' + munWorking.length;

        if(storedComHs[chosenCom] == null){
            hs.innerHTML = 1;
            storedComHs[chosenCom] = 1;
        } else {
            hs.innerHTML = storedComHs[chosenCom];
        }
    } else {
        hs.innerHTML = storedHs;
    }
    saveLocalStorage();

    score.parentNode.style.opacity = 1;
    hs.parentNode.style.opacity = 1;
    hs.parentNode.style.color = 'white';
    newRecordDiv.style.display = 'none';
    newRecord = false;
    document.querySelector('.results-wrapper').classList.remove('visible');
    document.querySelector('.modal-backdrop').classList.remove('visible');
    let randIndex = Math.floor(Math.random()*munWorking.length);
    let randRef = munWorking[randIndex];
    munWorking.splice(randIndex, 1);
    newRound(randRef);
    
}

var nextMun;
function newRound(ref) {
    if(munWorking.length <= 0){
        if(chosenCom == '0'){
            fillWorkingArray();
        } else {
            endGame();
            return false;
        }
    }

    nextMunContDesc.style.display = 'none';
    inputArea.style.display = 'block';
    refMunDOM[4].classList.remove('enabled');
    nextMunDOM[4].classList.remove('enabled');

    let randIndex = Math.floor(Math.random()*munWorking.length);
    nextMun = munWorking[randIndex];
    munWorking.splice(randIndex, 1);
    for(let i = 0; i < ref.length - 2; i++) {
        if(i == 2){
            refMunDOM[i].innerHTML = ref[i].replace(/\B(?=(\d{3})+(?!\d))/g,".");
            nextMunDOM[i].innerHTML = '';
        } else {
            refMunDOM[i].innerHTML = ref[i];
            nextMunDOM[i].innerHTML = nextMun[i];
        }
    }

    let refBG = new Image();
    refBG.onload = function() {
        refMunDOM[4].style.backgroundImage = 'url(' + refBG.src + ')';
        refMunDOM[4].classList.add('enabled');
        refBG = null;
    }
    refBG.src = `https://open.mapquestapi.com/staticmap/v4/getmap?key=J6PmbDfxsyeGxdGQEuvRE95MEpct00iS&declutter=true&size=960,1080&zoom=10&center=${ref[4]},${ref[5]}`;

    let nextBG = new Image();
    nextBG.onload = function() {
        nextMunDOM[4].style.backgroundImage = 'url(' + nextBG.src + ')';
        nextMunDOM[4].classList.add('enabled');
        nextBG = null;
    }
    nextBG.src = `https://open.mapquestapi.com/staticmap/v4/getmap?key=J6PmbDfxsyeGxdGQEuvRE95MEpct00iS&declutter=true&size=960,1080&zoom=10&center=${nextMun[4]},${nextMun[5]}`;

        
}

var countUp;
function answer(isHigher){
    countUp = null;
    countUp = new CountUp(nextMunDOM[2], nextMun[2], {duration: 1,separator: '.'});
    if(!countUp.error){
        countUp.start();
    } else {
        nextMunDOM[2].innerHTML = nextMun[2]; // basic bitch
        console.error(countUp.error);
    }


    nextMunContDesc.style.display = 'block';
    inputArea.style.display = 'none';
    setTimeout(() => {
        if((refMunDOM[2].innerHTML.replace(/\./g,'') -nextMun[2].replace(/\./g,'') < 0) == (isHigher) || (refMunDOM[2].innerHTML-nextMun[2] == 0)){
            score.innerHTML++;
            if(Number(score.innerHTML) > Number(hs.innerHTML)){
                hs.innerHTML = score.innerHTML;
                hs.parentNode.style.color = 'gold';
                newRecord = true;

                if(chosenCom == '0'){
                    storedHs = hs.innerHTML;
                } else {
                    storedComHs[chosenCom] = hs.innerHTML;
                }
                saveLocalStorage();
            }
            newRound(nextMun);
        } else {
            endGame();
        }
    }, 2500);
}

function fillWorkingArray(){
    munWorking = [];
    if(chosenCom == '0'){
        for(let key in munDatabase){
            munWorking = munWorking.concat(munDatabase[key]);
        }
    } else {
        munWorking = munDatabase[chosenCom].slice();
    }
}

function endGame(){
    canLeave = true;
    if(newRecord){
        newRecordDiv.style.display = 'block';
    }
    document.querySelector('.results-wrapper').classList.add('visible');
    document.querySelector('.modal-backdrop').classList.add('visible');
    resultsScore.innerHTML = score.innerHTML + document.getElementById('score-fraction').innerHTML;
    resultsHS.innerHTML = hs.innerHTML;
    score.parentNode.style.opacity = 0;
    hs.parentNode.style.opacity = 0;
}

var btnIcon;
function expandHsList(btn){
    btnIcon = btn.querySelector('i');
    if(hsList.classList.contains('collapsed')){
        hsList.classList.remove('collapsed');
        btnIcon.className = 'fas fa-chevron-up rotate-icon';
    } else {
        hsList.classList.add('collapsed');
        btn.querySelector('i').className = 'fas fa-crown rotate-icon';
    }
    btnIcon.onanimationend = () => {
        btnIcon.classList.remove('rotate-icon');
    }
    
}

window.handleStart = handleStart;
window.startGame = startGame;
window.answer = answer;
window.expandHsList = expandHsList;

// UTILS

function getObjectLength(object){
    let cont = 0;
    for(let k in object) {
        cont += object[k].length;
    }
    return cont;
}

function saveLocalStorage(){
    window.localStorage.setItem('mun-hs',storedHs);
    window.localStorage.setItem('mun-com-hs',JSON.stringify(storedComHs));
}