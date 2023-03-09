var dataVariables;
var dataStations;
var dataRandom;
var done = 0;

const choiceDivs = document.querySelectorAll('.choice');
var randomStation, choices = [], correctChoice;

const scoreNum = document.querySelector('.score-num');
const hsNum = document.querySelector('.hs-num');

function init() {

    fetch('https://analisi.transparenciacatalunya.cat/resource/4fb2-n3yi.json') // Metadades variables meteorologiques
        .then(response => response.json())
        .then(data => {
            dataVariables = data;
            done++;
        });
    fetch('https://analisi.transparenciacatalunya.cat/resource/yqwd-vj5e.json') // Metadades estacions meteorologiques
        .then(response => response.json())
        .then(data => {
            dataStations = data;
            done++;
        });
    
    let storedHs = window.localStorage.getItem('meteo-hs');
    if(storedHs == null){
        hsNum.innerHTML = 0;
        window.localStorage.setItem('meteo-hs',0);
    } else {
        hsNum.innerHTML = storedHs;
    }
    
    
    loadJSON();
}

function loadJSON(){
    fetch('https://analisi.transparenciacatalunya.cat/resource/nzvn-apee.json?$select=codi_estacio,codi_variable,data_lectura,valor_lectura&data_lectura=' + randomDate(moment('2009-01-01'), moment().subtract(1,'day')))
        .then(response => response.json())
        .then(data => {
            dataRandom = data[Math.floor(Math.random() * data.length)];
            done++;
        });
    waitForLoad();
}

function waitForLoad(){
    if(done<3){
        setTimeout(() => {
            console.log('Waiting for JSONs...')
            waitForLoad();
        }, 50);
    } else {
        setupPage();
    }
}

function setupPage() {
    let date = moment(dataRandom.data_lectura);
    let variable = dataVariables.find(obj => {
        return obj.codi_variable == dataRandom.codi_variable;
    })

    document.querySelector('.date').innerHTML = date.format('DD/MM/YYYY');
    document.querySelector('.time').innerHTML = date.format('HH:mm');
    document.querySelector('.type').innerHTML = variable.nom_variable + ': ';
    document.querySelector('.number').innerHTML = dataRandom.valor_lectura;
    document.querySelector('.unit').innerHTML = variable.unitat;

    choices = [dataStations.find(obj => {
        return obj.codi_estacio == dataRandom.codi_estacio;
    })];
    choices[0].correct = true;
    correctChoice = choices[0];
    //console.log(correctChoice); //CHEATING MODE

    for(let i = 0; i < choiceDivs.length-1; i++) {
        do{
            randomStation = dataStations[Math.floor(Math.random() * dataStations.length)];
        } while(choices.find(item => {return randomStation.nom_municipi == item.nom_municipi }));
        randomStation.correct = false;
        choices.push(randomStation);
    }

    choiceDivs.forEach((choiceDiv,i) => {
        let randomIndex = Math.floor(Math.random()*choices.length);
        let randomChoice = choices[randomIndex]
        choiceDiv.querySelector('.town').innerHTML = randomChoice.nom_municipi;
        choiceDiv.querySelector('.comarca').innerHTML = randomChoice.nom_comarca;
        choiceDiv.id = randomChoice.codi_estacio;
        choices.splice(randomIndex,1);
    });
}

function checkAnswer(div) {
    if(correctChoice.codi_estacio != div.id) {
        div.classList.add('wrong');
        scoreNum.innerHTML = 0;
    } else {
        scoreNum.innerHTML = Number(scoreNum.innerHTML)+1;
        if(scoreNum.innerHTML > hsNum.innerHTML){
            hsNum.innerHTML = scoreNum.innerHTML;
            window.localStorage.setItem('meteo-hs',hsNum.innerHTML);
            hsNum.style.color = '#27c227';
        }
    }
    document.querySelector(`#${correctChoice.codi_estacio}`).classList.add('correct');

    choiceDivs.forEach(div => {
        div.style.pointerEvents = 'none';
    })
}

function reload(){
    choiceDivs.forEach(div => {
        div.className = 'choice';
        div.style.pointerEvents = 'all';
    });
    hsNum.style.color = 'white';
    done = 2;
    loadJSON();
}

function randomDate(start, end) {
    console.log(moment(start + (Math.random() * (end - start))).format('YYYY-MM-DDTHH:00:00.000'));
    return moment(start + (Math.random() * (end - start))).format('YYYY-MM-DDTHH:00:00.000');
}