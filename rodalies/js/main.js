// FIT TEXT
const isOverflown = ({ clientWidth, clientHeight, scrollWidth, scrollHeight }) => (scrollWidth > clientWidth) || (scrollHeight > clientHeight)
const resizeText = ({ element, elements, minSize = 10, maxSize = 512, step = 1, unit = 'px' }) => {
  (elements || [element]).forEach(el => {
    let i = minSize
    let overflow = false

        const parent = el.parentNode

    while (!overflow && i < maxSize) {
        el.style.fontSize = `${i}${unit}`
        overflow = isOverflown(parent)

      if (!overflow) i += step
    }

    // revert to last state where no overflow happened
    el.style.fontSize = `${i - step}${unit}`
  })
}

function fitAllText(){
    resizeText({
    elements: document.querySelectorAll('.fit'),
    step: 0.25
})
}
// END FIT TEXT

// CONSTANTS
const root = document.documentElement;
const colors = {
    1: '#7DBCEC',
    2: '#26A741',
    3: '#EA412B',
    4: '#F6A30D',
    7: '#B57BBA',
    8: '#88006A'
}
const estacions = {
	1: ["Molins de Rei",
		"Sant Feliu de Llobregat",
		"Sant Joan Despí",
		"Cornellà",
		"L'Hospitalet de Llobregat",
		"Torrassa",
		"Sants",
		"Plaça de Catalunya",
		"Arc de Triomf",
		"El Clot-Aragó",
		"Sant Adrià de Besòs",
		"Badalona",
		"Montgat",
		"Montgat Nord",
		"El Masnou",
		"Ocata",
		"Premià de Mar",
		"Vilassar de Mar",
		"Cabrera de Mar",
		"Mataró Oest",
		"Mataró Centre",
		"Mataró Est",
		"Mataró",
		"Sant Andreu de Llavaneres",
		"Caldes d'Estrac",
		"Arenys de Mar",
		"Canet de Mar",
		"Sant Pol de Mar",
		"Calella",
		"Pineda de Mar",
		"Santa Susanna",
		"Malgrat de Mar",
		"Blanes",
		"Tordera",
		"Maçanet-Massanes"],
	2: ["Sant Vicenç de Calders",
		"Calafell",
		"Segur de Calafell",
		"Cunit",
		"Cubelles",
		"Vilanova i la Geltrú",
		"Sitges",
		"Garraf",
		"Platja de Castelldefels",
		"Castelldefels",
		"Gavà",
		"Viladecans",
		"Aeroport - T2",
		"El Prat de Llobregat",
		"Bellvitge",
		"Barcelona Sants",
		"Passeig de Gràcia",
		"Estació de França",
		"El Clot-Aragó",
		"Sant Andreu Comtal",
		"Montcada i Reixac",
		"La Llagosta",
		"Mollet-Sant Fost",
		"Montmeló",
		"Granollers Centre",
		"Les Franqueses Granollers Nord",
		"Cardedeu",
		"Llinars del Vallès",
		"Palautordera",
		"Sant Celoni",
		"Gualba",
		"Riells i Viabrea-Breda",
		"Hostalric",
		"Maçanet-Massanes"],
	3: ["L'Hospitalet de Llobregat",
		"Sants",
		"Plaça de Catalunya",
		"Arc de Triomf",
		"La Sagrera - Meridiana",
		"Sant Andreu Arenal",
		"Torre Baró",
		"Montcada Bifurcació",
		"Montcada-Ripollet",
		"Santa Perpètua de Mogoda",
		"Mollet - Santa Rosa",
		"Parets del Vallès",
		"Granollers-Canovelles",
		"Les Franqueses del Vallès",
		"La Garriga",
		"Figaró",
		"Sant Martí de Centelles",
		"Centelles",
		"Balenyà - els Hostalets",
		"Balenyà-Tona-Seva",
		"Vic",
		"Manlleu",
		"Torelló",
		"Borgonyà",
		"Sant Quirze de Besora",
		"La Farga de Bebié",
		"Ripoll",
		"Campdevànol",
		"Ribes de Freser",
		"Planoles",
		"Toses",
		"La Molina",
		"Urtx-Alp",
		"Puigcerdà",
		"La Tor de Querol"],
	4: ["Sant Vicenç de Calders",
		"El Vendrell",
		"L'Arboç",
		"Els Monjos",
		"Vilafranca del Penedès",
		"La Granada",
		"Lavern-Subirats",
		"Sant Sadurní d'Anoia",
		"Gelida",
		"Martorell Oest",
		"Martorell",
		"Castellbisbal",
		"El Papiol",
		"Molins de Rei",
		"Sant Feliu de Llobregat",
		"Sant Joan Despí",
		"Cornellà",
		"L'Hospitalet de Llobregat",
		"Sants",
		"Plaça de Catalunya",
		"Arc de Triomf",
		"La Sagrera-Meridiana",
		"Sant Andreu Arenal",
		"Torre Baró",
		"Montcada Bifurcació",
		"Montcada i Reixac - Manresa",
		"Montcada i Reixac - Santa Maria",
		"Cerdanyola del Vallès",
		"Barberà del Vallès",
		"Sabadell Sud",
		"Sabadell Centre",
		"Sabadell Nord",
		"Terrassa Est",
		"Terrassa",
		"Sant Miquel de Gonteres",
		"Viladecavalls",
		"Vacarisses-Torreblanca",
		"Vacarisses",
		"Castellbell i el Vilar",
		"Sant Vicenç de Castellet",
		"Manresa"],
	7: ["Cerdanyola Universitat",
		"Cerdanyola del Vallès",
		"Montcada i Reixac - Santa Maria",
		"Montcada i Reixac - Manresa",
		"Montcada Bifurcació",
		"Torre Baró",
		"Sant Andreu Arenal"],
	8: ["Martorell",
		"Castellbisbal",
		"Rubí",
		"Sant Cugat del Vallès",
		"Cerdanyola Universitat",
		"Mollet - Sant Fost",
		"Montmeló",
		"Granollers Centre"]
}

// APP
function startAnimation(){
	const wrapper = document.querySelector('.wrapper');
	const liniaText = document.querySelector('.linia');
	const infoText = document.querySelector('.info');
	const desti = document.querySelector('.desti');

	const urlSearchParams = new URLSearchParams(window.location.search);
	const params = Object.fromEntries(urlSearchParams.entries());
	var linia = params['l'];
	let esl = params['reverse']=='true' ? estacions[linia].reverse() : estacions[linia];
	esl.splice(0,esl.indexOf(params['a'])+1);

	root.style.setProperty('--lc',colors[linia]);
	liniaText.innerHTML = 'R' + linia;
	desti.innerHTML = esl[esl.length-1].toUpperCase();
	esl.forEach((estacio) => {
		let textContainer = document.createElement('div');
		textContainer.classList.add('estacio-container');
		
		let textSpan = document.createElement('span');
		textSpan.innerHTML = estacio;
		textSpan.className = 'estacio fit';
		
		let textDecor = document.createElement('div');
		textDecor.classList.add('estacio-decor');

		textContainer.appendChild(textSpan);
		textContainer.appendChild(textDecor);
		infoText.appendChild(textContainer);
	});

	
	root.style.setProperty('--ticker',`-${100*(esl.length+2)}%`);
	root.style.setProperty('--ticker-time',`${2*(esl.length+2)}s`);

	fitAllText();
	window.addEventListener('resize',() => {
		fitAllText();
	});

	infoText.style.setProperty('animation-play-state','running');
}

// FORM
const liniaList = document.getElementById('linia');
const dirList = document.getElementById('dir');
const statList = document.getElementById('actual');
function handleForm(){
	updateLists();
	liniaList.addEventListener('change',updateLists);
}

function updateLists(){
	// DESTINATION
	let e1 = document.createElement('option');
	e1.innerHTML = estacions[liniaList.value].slice(-1)[0];
	e1.value = 'false';
	let e2 = document.createElement('option');
	e2.innerHTML = estacions[liniaList.value][0];
	e2.value = 'true';
	dirList.innerHTML = '';
	dirList.appendChild(e1);
	dirList.appendChild(e2);

	// STARTING STATION
	var correctStations = estacions[liniaList.value];
	console.log(dirList.value);
	console.log(correctStations);
	statList.innerHTML = '';
	correctStations.forEach((s)=> {
		let e = document.createElement('option');
		e.innerHTML = s;

		statList.appendChild(e);
	});

	// COLOR
	root.style.setProperty('--lc',colors[liniaList.value]);
}

function updateStationList(){
	
}
