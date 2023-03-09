
var hs = window.localStorage.getItem('type-hs') == null ? 0 : window.localStorage.getItem('type-hs');
const infoText = document.getElementById('info-text');
const infoSub = document.getElementById('info-sub');
const typeArea = document.getElementById('type-area');
const typeInput = document.getElementById('type-input');
var ended = false;
var startTime, splitStart;
var excerpts = ["equisde","La por d'agafar avions li ve de lluny, encara que no està gaire segur d'on va sortir. De petit, hi va viatjar diverses vegades acompanyat dels seus pares i no recorda plors ni súpliques, sinó més aviat l'emoció de sentir com l'avió s'enlairava.","Després, per una història que ara seria massa llarga d'explicar, va passar-se uns quants anys fent viatges de pocs quilòmetres i quan, passat aquest període, va haver de tornar a agafar un avió no es va ni tan sols imaginar que l'angoixa de volar apareixeria de sobte.","Va pujar en aquell avió sense experimentar cap tipus de malestar i no va ser fins que es va veure assegut i amb el cinturó posat que va quedar-se sense aire. No recorda com però va aconseguir baixar-ne i des de llavors ha desenvolupat una sèrie d'estratègies per evitar aquest transport."];
var excerptIndex;
var keyTimes = [];

function waitForStart(){
    document.getElementById('hs').innerHTML = hs + ' WPM';
}

function startGame(){
    document.querySelector('.title').style.display = 'none';
    document.querySelector('.game').style.display = 'flex';
    excerptIndex = Math.floor(Math.random()*excerpts.length);
    excerpts[excerptIndex].split('').forEach(char => {
        let charspan = document.createElement('span');
        charspan.innerHTML = char;
        typeArea.appendChild(charspan);
    });

    startTime = new Date;
    splitStart = startTime;

    typeInput.focus();
    typeInput.addEventListener('input',pressKey);

    window.addEventListener("keydown", function(e) {
        if([37, 38, 39, 40].indexOf(e.keyCode) > -1){
            e.preventDefault();
        }
    }, false);
}

function pressKey(){
    let currentTime = new Date;
    keyTimes.push(currentTime - splitStart);
    splitStart = currentTime;
    let wpm = getWPM();
    infoText.innerHTML = `WPM: ${wpm}`;
    console.log(typeInput.value + ', time: ' + keyTimes[keyTimes.length - 1]);

    let charIndex = typeInput.value.length - 1;
    if(charIndex > -1){
        if(typeInput.value[charIndex] == excerpts[excerptIndex][charIndex]) {
            typeArea.childNodes[charIndex].className = 'c-char';
        } else {
            typeArea.childNodes[charIndex].className = 'w-char';
        }
    }
    
    if(typeInput.value == excerpts[excerptIndex]){
        ended = true;

        if(hs < wpm){
            hs = wpm;
            document.getElementById('hs').innerHTML = wpm + ' WPM';
            window.localStorage.setItem('type-hs',wpm);
        }

        typeArea.style.display = 'none';
        infoText.innerHTML = 'Average time per character<br>' + getAverage(keyTimes) + 'ms<br><br>WPM<br>' + getWPM();
        infoSub.innerHTML = 'Click to try again';
    } else {
        typeArea.childNodes[charIndex + 1].className = '';
    }
}

function getAverage(array){
    let average = 0;
    array.forEach(n => {
        average += n;
    });
    return Math.round((average / array.length)*100)/100;
}

function getWPM(){
    return Math.round((typeInput.value.length/5)/((new Date - startTime)/60000));
}

function restartGame(){
    if(ended){
        window.location = window.location;
    }
}