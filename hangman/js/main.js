const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var passwds = {
    animal: ["Abadejo",
    "Abalone",
    "Abejarón",
    "Abejaruco",
    "Abeja",
    "Abejorro",
    "Ácaro",
    "Acedía",
    "Acentor",
    "Agamido",
    "Águila",
    "Alacrán",
    "Albatros",
    "Alce",
    "Almeja",
    "Alondra",
    "Ánade Real",
    "Anchoa",
    "Anémona de mar",
    "Anfioxo",
    "Angelote",
    "Anguila",
    "Antílope",
    "Araña",
    "Arenque",
    "Armadillo",
    "Armiño",
    "Asno",
    "Atún",
    "Avefría",
    "Avestruz",
    "Avetoro",
    "Avispa	Babirusa",
    "Babosa",
    "Babuino",
    "Bacalao",
    "Ballena",
    "Banteng",
    "Barasinga",
    "Barracuda",
    "Becada",
    "Beira",
    "Beluga",
    "Bengalí",
    "Bermejuela",
    "Berrendo",
    "Besugo",
    "Bisbita",
    "Bisonte",
    "Blanquillo",
    "Boa",
    "Bogavante",
    "Bongo",
    "Bonito",
    "Bonobo",
    "Boto",
    "Buey",
    "Búfalo",
    "Búho",
    "Buitre",
    "Burro",
    "Caballo",
    "Caballito de mar",
    "Cacatúa",
    "Cachalote",
    "Calamón",
    "Camaleón",
    "Camello",
    "Canguro",
    "Canario",
    "Cangrejo",
    "Caracol",
    "Castor",
    "Cebra",
    "Centollo",
    "Cerdo",
    "Chacal",
    "Chimpancé",
    "Chinchilla",
    "Ciempiés",
    "Ciervo",
    "Cigala",
    "Cisne",
    "Cobaya",
    "Cochinilla",
    "Cocodrilo",
    "Coendú",
    "Coipú",
    "Colibrí",
    "Comadreja",
    "Conejo",
    "Coral",
    "Coridora",
    "Cormorán",
    "Cóndor",
    "Cotorra",
    "Coyote",
    "Damán",
    "Delfín",
    "Diablo de Tasmania",
    "Dik-dik",
    "Dingo",
    "Dragón de Komodo",
    "Dromedario",
    "Elefante",
    "Emú",
    "Equidna",
    "Erizo",
    "Escarabajo",
    "Escorpión",
    "Escuerzo",
    "Espátula común",
    "Estrella de mar",
    "Faisán",
    "Flamingo",
    "Flamenco",
    "Foca",
    "Gacela",
    "Galápago",
    "Gallina",
    "Gallipato",
    "Gallo",
    "Gamba",
    "Ganso",
    "Garcilla",
    "Garrapata",
    "Garza",
    "Gato",
    "Gavilán",
    "Glotón",
    "Golondrina",
    "Gorila",
    "Gorgojo",
    "Gorrión",
    "Grillo",
    "Grulla",
    "Guepardo",
    "Halcón",
    "Hamster",
    "Hiena",
    "Hipocampo",
    "Hipopótamo",
    "Holoturia",
    "Hormiga",
    "Hurón",
    "Hupón",
    "Ibice",
    "Icotea",
    "Iguana",
    "Insecto palo",
    "Intendio",
    "Impala",
    "Jabalí",
    "Jabirú",
    "Jerbo",
    "Jirafa",
    "Jaguar",
    "Kaguang",
    "Kiwi",
    "Krill",
    "Koala",
    "Labro",
    "Lagarto",
    "Langosta",
    "Langostino",
    "Lechuza",
    "Lémur",
    "León",
    "León marino",
    "Leopardo",
    "Libélula",
    "Liebre",
    "Lince",
    "Llama",
    "Lobo",
    "Lobo marino",
    "Lombriz",
    "Loro",
    "Luciérnaga",
    "Mamut",
    "Mandril",
    "Mantis religiosa",
    "Mapache",
    "Marabú",
    "Marabunta",
    "Mariposa",
    "Marmota",
    "Medusa",
    "Mejillón",
    "Milpiés",
    "Mofeta",
    "Mono",
    "Mosca",
    "Mosquito",
    "Morsa",
    "Murciélago",
    "Narval",
    "Navaja",
    "Nécora",
    "Nutria",
    "Ñandú",
    "Ñu",
    "Ocelote",
    "Okapi",
    "Oso",
    "Oso de agua",
    "Oso hormiguero",
    "Oso panda",
    "Oso pardo",
    "Ornitorrinco",
    "Oveja",
    "Pájaro",
    "Paloma",
    "Pantera",
    "Papagayo",
    "Pelicano",
    "Perca",
    "Perdiz",
    "Perezoso",
    "Perico",
    "Peripato",
    "Periquito",
    "Perro",
    "Petirrojo",
    "Pez",
    "Pingüino",
    "Pinzón",
    "Piojo",
    "Piquituerto",
    "Polilla",
    "Puercoespín",
    "Pulga",
    "Pulpo",
    "Puma",
    "Quebrantahuesos",
    "Quetzal",
    "Quitón",
    "Rana",
    "Rata",
    "Ratón",
    "Raya",
    "Rebeco",
    "Rémora",
    "Reno",
    "Rinoceronte",
    "Rubia Gallega",
    "Ruiseñor",
    "Salamandra",
    "Salmón",
    "Saltamontes",
    "Sanguijuela",
    "Sapo",
    "Sepia",
    "Serpiente",
    "Tábano",
    "Tejón",
    "Tenia",
    "Termita",
    "Tiburón",
    "Tigre",
    "Tijereta",
    "Topo",
    "Toro",
    "Tortuga",
    "Tritón",
    "Trucha",
    "Tucán",
    "Urogallo",
    "Urraca",
    "Vaca",
    "Varano",
    "Venado",
    "Vicuña",
    "Wapití",
    "Walabi",
    "Walaró",
    "Weta",
    "Wombat	",
    "Xenopus",
    "Xenopus laevis",
    "Xoloescuintle",
    "Yak",
    "Yacare",
    "Yegua",
    "Zarigüeya",
    "Zorro",
    "Zebra"],
    ciudad: ["Madrid",
    "Barcelona",
    "Valencia",
    "Sevilla",
    "Zaragoza",
    "Málaga",
    "Murcia",
    "Palma de Mallorca",
    "Las Palmas",
    "Bilbao",
    "Alicante",
    "Córdoba",
    "Valladolid",
    "Vigo",
    "Gijón",
    "Hospitalet de Llobregat",
    "Vitoria",
    "La Coruña",
    "Elche",
    "Granada",
    "Tarrasa",
    "Badalona",
    "Oviedo",
    "Sabadell",
    "Cartagena",
    "Jerez de la Frontera",
    "Móstoles",
    "Santa Cruz de Tenerife",
    "Pamplona",
    "Almería",
    "Alcalá de Henares",
    "Fuenlabrada",
    "Leganés",
    "San Sebastián",
    "Getafe",
    "Burgos",
    "Albacete",
    "Santander",
    "Marbella",
    "Salamanca",
    "Huelva",
    "Lérida",
    "Tarragona"],
    friki: ["Amdír",
    "Amroth",
    "Anborn",
    "Angbor",
    "Aragorn II",
    "Arod",
    "Arwen",
    "Barahir",
    "Bardo II",
    "Baya de Oro",
    "Beregond",
    "Berserker",
    "Bestia Alada",
    "Bilbo Bolsón",
    "Bill Helechal",
    "Boca de Sauron",
    "Bodo Ganapié",
    "Boromir",
    "Brand",
    "Bárbol",
    "Castamir",
    "Celeborn",
    "Ceorl",
    "Círdan",
    "Damrod",
    "Daño de Durin",
    "Derufin",
    "Dervorin",
    "Duilin",
    "Duinhir",
    "Déagol",
    "Déorwine",
    "Dúnhere",
    "Dúnher",
    "Elanor Gamyi",
    "Elfhelm",
    "Ella-Laraña",
    "Elladan",
    "Elrohir",
    "Elrond",
    "Erestor",
    "Erkenbrand",
    "Faramir",
    "Forlong",
    "Fredegar Bolger",
    "Frodo Bolsón",
    "Frodo Jardner",
    "Galadriel",
    "Gamelin",
    "Gandalf",
    "Ghân-Buri-Ghân",
    "Gildor Inglorion",
    "Gimli",
    "Glorfindel",
    "Glóin",
    "Golasgil",
    "Gollum",
    "Gorbag",
    "Gothmog",
    "Grimbold",
    "Gríma",
    "Gwaihir",
    "Halbarad",
    "Haldir",
    "Hamfast Gamyi",
    "Hasufel",
    "Hirgon",
    "Hirluin",
    "Hoja de Viento",
    "Háma",
    "Imrahil",
    "Ingold",
    "Khamûl",
    "La serpiente negra",
    "Landroval",
    "Legolas",
    "Lindir",
    "Mablung",
    "Madril",
    "Maggot",
    "Mauhúr",
    "Meneldor",
    "Meriadoc Brandigamo",
    "Nimrodel",
    "Odo Ganapié",
    "Peregrin Tuk",
    "Pies de Fuego",
    "Ramaviva",
    "Rey Brujo",
    "Rey de los Muertos",
    "Roheryn",
    "Rosa Coto",
    "Samsagaz Gamyi",
    "Saruman",
    "Sauron",
    "Sharku",
    "Sombragrís",
    "Thorin III",
    "Théoden",
    "Théodred",
    "Tom Bombadil",
    "Uglúk",
    "Viejo Hombre-Sauce",
    "Águilas",
    "Éomer",
    "Éomund",
    "Éowyn"],
    hardcore: randomWord()
};
const arraybody = document.getElementsByClassName("body");
const guessingDiv = document.getElementById('guessed-word');
const root = document.documentElement;
var passwd; // palabra secreta
var guessedWord = "";

function randomWord(){
    var w = "";
    var wl = 4 + Math.floor(Math.random()*4);
    for(let i = 0; i<wl;i++){
        w = w + letters[Math.floor(Math.random()*letters.length)];
    }
    return [w];
}

function generatePassword(twoPlayers){

    if(twoPlayers){
        passwd = document.forms[1].elements[0].value.toUpperCase();
    } else {
        var categories = [];
        var choices = document.forms[0].elements;
        if(Array.prototype.slice.call(choices).some(x => x.checked)){
            for(let i = 0; i<choices.length - 1; i++){
                if(choices[i].type == 'checkbox' && choices[i].checked){
                    categories.push(choices[i].id);
                }
            }
            var categoryRandom = passwds[categories[Math.floor(Math.random()*categories.length)]];
            passwd = categoryRandom[Math.floor(Math.random()*categoryRandom.length)].toUpperCase();
        } else {
            alert('Debes seleccionar almenos una categoría');
        }
    }
    
    console.log(passwd);

    for(let i = 0; i<passwd.length;i++){
        if(passwd[i] == ' '){
            guessedWord += '- ';
        } else {
            guessedWord += '_ ';
        }
        
    }
    guessingDiv.innerHTML = guessedWord;

    document.getElementById("form-wrapper").style.display = "none";
    document.getElementById("game").style.display = "flex";
    
    
}

var fails = 0;
const usedLetters = document.getElementById('used-letters');
function failedLetter(letter){
    for (let i = -1; i<fails; i++){
        arraybody[fails].style.visibility = "visible";
        arraybody[fails].classList.add("animated");
    }
    usedLetters.innerHTML += letter + " ";
    fails++;
    if(fails>=6){
        root.style.setProperty('--col','#ff0000');
        document.getElementById('input-form').style.visibility = 'hidden';
        guessingDiv.innerHTML = passwd;
        setTimeout(() => {
            alert('cagaste');
        }, 2000);
    }
}
function naisLetter(letter){
    for(let i = 0;i<passwd.length;i++){
        if(passwd[i]==letter){
            guessedWord = guessedWord.split('');
            guessedWord[i*2] = letter; 
            guessedWord = guessedWord.join('');
            console.log(guessedWord);
        }
    }
    if(!guessedWord.includes('_ ')){
        for (let i = 0; i<6; i++){
            arraybody[i].style.visibility = "visible";
            arraybody[i].classList.add("animated");
        }
        root.style.setProperty('--col','#00a000');
        document.getElementById('input-form').style.visibility = 'hidden';
        setTimeout(() => {
            alert("se muere igual pringao");
        }, 2000);
        
    }
    guessingDiv.innerHTML = guessedWord;
}
function checking(){
    var LInput = document.getElementById("m_word");
    var myL = LInput.value.toUpperCase();
    if (passwd.includes(myL)){
        naisLetter(myL);
    }
    else{
        failedLetter(myL);
    }
    LInput.value = "";
    LInput.focus();
}

