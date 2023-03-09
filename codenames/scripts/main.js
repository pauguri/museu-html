const wordPool = ["ADVOCAT", "ÀFRICA", "AGENT", "ÀGUILA", "AGULLA", "AIGUA", "AIRE", "ALEMANYA", "AMBAIXADA", "AMBULÀNCIA", "AMÈRICA", "AMPOLLA", "ANELL", "ÀNGEL", "ANGLATERRA", "ANTÀRTIDA", "APÈNDIX", "ARANYA", "ARC", "ÀREA", "ARGENTINA", "AS", "AS", "ASTECA", "ATLÀNTIDA", "AVIÓ", "BALA", "BALENA", "BANC", "BANDA", "BARALLA", "BARRA", "BATERIA", "BERLÍN", "BERMUDES", "BESSÓ", "BISBE", "BLAU", "BLEDA", "BLOC", "BOCA", "BOLA", "BOLET", "BOMBA", "BORDA", "BOSC", "BOTA", "BOTIFARRA", "BOTÓ", "BRUIXA", "BUFÓ", "CABINA", "CACTUS", "CADENA", "CADIRA", "CAGANER", "CAIXA", "CALÇOT", "CÀLCUL", "CAMP", "CAMPANA", "CANAL", "CANGUR", "CANVI", "CANYA", "CAP", "CAPA", "CAPGRÒS", "CAPITAL", "CAQUI", "CARA", "CARAVANA", "CARGOL", "CÀRREGA", "CARRERA", "CARRO", "CARTA", "CAS", "CASA", "CASINO", "CASTANYA", "CASTELL", "CAU", "CAVALL", "CAVALLER", "CENTAURE", "CENTRE", "CEP", "CERCLE", "CIENTÍFIC", "CINTA", "CINTURÓ", "CLASSE", "CLAU", "CLOT", "COBERTA", "COCA", "COCO", "CODI", "COLL", "COLÒNIA", "COLUMNA", "COMA", "COMPÀS", "COMPOST", "CONCERT", "CONILL", "COP", "COPA", "COR", "CORDA", "CORNETA", "CORONA", "CORREDOR", "CORRENT", "CORREU", "COTÓ", "COTXE", "CRESTA", "CREU", "CROMO", "CUA", "CUC", "CUINER", "CULLERA", "DAMA", "DELTA", "DENT", "DEU", "DIA", "DIAMANT", "DIANA", "DINOSAURE", "DISC", "DO", "DRAC", "EBRE", "EGIPTE", "EMPERADOR", "ENLLAÇ", "ENTERRAMORTS", "ENTRADA", "ENXANETA", "ESCORPÍ", "ESGLÉSIA", "ESPAI", "ESPIA", "ESTACIÓ", "ESTADI", "ESTANY", "ESTRELLA", "ETIQUETA", "EUROPA", "EXTRATERRESTRE", "FALANGE", "FALÇ", "FANTASMA", "FARINERA", "FESTA", "FIGA", "FIGURA", "FITXA", "FLAMENC", "FLAUTA", "FLETXA", "FOC", "FOLRA", "FONT", "FORAT", "FORÇA", "FRANC", "FRANÇA", "FREDOLIC", "FREQÜÈNCIA", "FUET", "FURGONETA", "GALETA", "GAMARÚS", "GAMMA", "GANIVET", "GANXO", "GAT", "GAUDÍ", "GEGANT", "GEL", "GELAT", "GENI", "GOLF", "GOS", "GOTA", "GRA", "GRALLA", "GRATACEL", "GRAU", "GRÈCIA", "GRIPAU", "GUANT", "GUERRA", "HELICÒPTER", "HERBA", "HOLLYWOOD", "HOSPITAL", "HOTEL", "ÍNDIA", "INFERMERA", "ITÀLIA", "KIWI", "LÀSER", "LIMUSINA", "LÍNIA", "LLAÇ", "LLADRE", "LLENGUA", "LLENYA", "LLEÓ", "LLIT", "LLIURE", "LLOM", "LLUM", "LLUNA", "LONDRES", "MÀ", "MADUR", "MÀGIA", "MALALTIA", "MALTA", "MAMA", "MARCA", "MARFIL", "MARXA", "MÀSCARA", "MASIA", "MASSA", "MEL", "MELIC", "MERCURI", "MESTRE", "META", "METGE", "MÈXIC", "MICROSCOPI", "MILIONARI", "MÍSSIL", "MOC", "MODEL", "MODERNISME", "MÒDUL", "MOLA", "MOLL", "MOLLA", "MONA", "MONITOR", "MONTSERRAT", "MORT", "MORTER", "MOSCOU", "MOTOR", "MUR", "NAN", "NAU", "NAVALLA", "NEU", "NIL", "NINA", "NINJA", "NIT", "NOTA", "NOU", "NOVA YORK", "NUCLI", "NUS", "OBRA", "OLI", "OLIMP", "ONA", "ÒPERA", "OR", "ORENETA", "ORGUE", "ORNITORINC", "ÓS", "PAL", "PALA", "PALMA", "PANTALLA", "PAPER", "PARACAIGUDES", "PARTIDA", "PASSIÓ", "PASTA", "PASTANAGA", "PASTILLA", "PATGE", "PATUFET", "PEIX", "PEKÍN", "PEL·LÍCULA", "PENAL", "PENYA-SEGAT", "PERIQUITO", "PESA", "PEU", "PILA", "PILAR", "PILOT", "PINGÜÍ", "PINTA", "PINYA", "PIRÀMIDE", "PIRATA", "PIRINEUS", "PISTA", "PISTOLA", "PLANTA", "PLANXA", "PLATA", "PLATJA", "PLOM", "POLICIA", "POLS", "POLZE", "POMA", "PONT", "POP", "PORT", "PORTADA", "PORTER", "POU", "PREMSA", "PRINCESA", "PUNT", "PUNTA", "RADI", "RAIG", "RATOLÍ", "RATPENAT", "REI", "REINA", "REVOLUCIÓ", "ROBOT", "ROMA", "RONDA", "ROSA", "ROSSINYOL", "ROVELL", "RULETA", "SABATA", "SÀHARA", "SALSA", "SAMFAINA", "SANT JORDI", "SATÈL·LIT", "SATURN", "SENYAL", "SERP", "SERRA", "SET", "SIRENA", "SOBRE", "SOLDAT", "SORT", "SUBMARINISTA", "SUÏS", "SUPERHEROI", "TACTE", "TALL", "TALP", "TAPA", "TARONJA", "TAULA", "TAULER", "TEATRE", "TELESCOPI", "TEMPS", "TERRA", "TERRASSA", "TIÓ", "TÒQUIO", "TORN", "TERRA", "TORTUGA", "TRIBUNA", "TROMPA", "TRONC", "TRUITA", "TUB", "ULL", "UNICORN", "VAIXELL", "VALL", "VAMPIR", "VENT", "VENUS", "VERÍ", "VERMUT", "VESTIT", "VIDA", "VIDRE", "XARXA", "XOC", "XOCOLATA"];
const typePool = [3,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0];
const root = document.documentElement;
const board = document.querySelector('.board');
const smf = document.getElementById('spymaster-form');
const info = document.querySelector('.info');
const hintBox = document.querySelector('.hint-box');
const eob = document.getElementById('end-operative-btn');
const rb = document.getElementById('ready-btn');
var clickableCards = false;
var redTurn = true;
var guessCount = 0;
var correctCount = {
    blue: 0,
    red: 0
}
var maxGuess;

function prepBoard(){
    for(let i = 0; i < 25; i++){
        let card = document.createElement('div');
        let wordIndex = Math.floor(Math.random()*wordPool.length);
        card.innerHTML = wordPool[wordIndex];
        card.style.animationDelay = `${50*i}ms`;
        card.className = 'card hidden card-anim';
        card.onanimationend = () => {
            card.className = 'card';
            card.style.removeProperty('animation-delay');
        };
        card.setAttribute('onclick','selectCard(this)');
        let typeIndex = Math.floor(Math.random()*typePool.length);
        card.dataset.type = typePool[typeIndex];
        board.appendChild(card);

        wordPool.splice(wordIndex,1);
        typePool.splice(typeIndex,1);
    }
    setTimeout(() => {
        rb.style.display = 'inline';
        info.innerHTML = "<span class='red'>Cap d'espies vermell</span>, prem el botó quan estiguis fora de la vista de tothom.";
    }, 3000);
}

function readyButtonPress(btn){
    btn.style.display = 'none';
    info.innerHTML = redTurn ? "<span class='red'>Cap d'espies vermell</span>, escriu una pista i la quantitat de noms associats a la pista." : "<span class='blue'>Cap d'espies blau</span>, escriu una pista i la quantitat de noms associats a la pista.";
    smf.style.display = 'block';
    setKeyShown(true);
}

function submitSMF(form){
    setKeyShown(false);
    form.style.display = 'none';
    hintBox.innerHTML = form.elements[0].value.toUpperCase() + ' ' + form.elements[1].value;
    maxGuess = form.elements[1].value;
    form.elements[0].value = '';
    form.elements[1].value = '';
    info.innerHTML = redTurn ? "<span class='red'>Operatiu vermell</span>, sel·lecciona els noms corresponents a aquesta pista:" : "<span class='blue'>Operatiu blau</span>, sel·lecciona els noms corresponents a aquesta pista:";
    eob.style.display = 'inline';
    clickableCards = true;
}

function endOperativeTurn(){
    eob.style.display = 'none';
    hintBox.innerHTML = '';
    guessCount = 0;
    redTurn = !redTurn;
    root.style.setProperty('--btn-c', redTurn ? '#eca7a7' : '#add8e6');
    clickableCards = false;
    info.innerHTML = redTurn ? "<span class='red'>Cap d'espies vermell</span>, prem el botó quan estiguis fora de la vista de tothom." : "<span class='blue'>Cap d'espies blau</span>, prem el botó quan estiguis fora de la vista de tothom.";

    rb.style.display = 'inline';
}

function setKeyShown(bool){
    clickableCards = !bool;
    board.childNodes.forEach(element => {
        let c;
        switch(element.dataset.type){
            case '0':
                c = 'gray-card';
                break;
            case '1':
                c = 'red-card';
                break;
            case '2':
                c = 'blue-card';
                break;
            case '3':
                c = 'black-card';
                break;
            default:
                console.error('Invalid card type, wtf');
        }
        if(bool){
            element.classList.add(c);
        } else {
            element.classList.remove(c);
        } 
    });
}

function selectCard(card){
    if(clickableCards && !card.classList.contains('chosen')){
        let c,h, eg = false, et = false;
        switch(card.dataset.type){
            case '0': // bystander
                c = 'chosen-gray';
                h = '<i class="fas fa-user"></i>';
                et = true;
                break;
            case '1': // red agent
                c = 'chosen-red';
                h = '<i class="fas fa-user-check"></i>';
                correctCount.red++;
                if(!redTurn){
                    et = true;
                }
                break;
            case '2': // blue agent
                c = 'chosen-blue';
                h = '<i class="fas fa-user-check"></i>';
                correctCount.blue++;
                if(redTurn){
                    et = true;
                }
                break;
            case '3': // SPY!!!
                c = 'chosen-black';
                h = '<i class="fas fa-user-secret"></i>';
                eg = true;
            default:
                console.error('Invalid card type, wtf');
        }
        card.classList.add('chosen');
        card.classList.add(c);
        card.innerHTML = h;
        card.dataset.chosen = true;

        if(eg){
            endGame(redTurn ? 'b' : 'r');
            return;
        } else if(correctCount.red >= 9){
            endGame('r');
            return;
        } else if(correctCount.blue >=8){
            endGame('b');
            return;
        }

        guessCount++;
        console.log(guessCount + ' ' + maxGuess);
        if(guessCount > maxGuess || et){
            endOperativeTurn();
        }
    }
}

function endGame(color){
    setKeyShown(true);
    eob.style.display = 'none';
    hintBox.style.display = 'none';
    rb.style.display = 'none';
    info.innerHTML = color == 'r' ? "<span class='red'>GUANYA L'EQUIP VERMELL</span>" : "<span class='blue'>GUANYA L'EQUIP BLAU</span>";
}