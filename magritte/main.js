const cells = document.getElementsByClassName("cell");
const nouns = {
    es: ["Abadesa","Abeja","Accidente","Álamo","Almena","Alumno","Andamio","Animal","Árbol","Bacteria","Bestia","Caballo","Cafeto","Canción","Carga","Casa","Constelación","Chiquillo","Ciudadano","Clérigo","Collar","Cuaderno","Delegado","Diente","Espectador","Estrella","Estudiante","Flor","Fusil","Gallina","Gato","Habitante","Hincha","Hoja","Hormiga","Instrumento","Letra","Libro","Lobo","Maíz","Montaña","Muchacho","Mueble","Músico","Navío","Novillo","Pájaro","Palabra","Pariente","Pelo","Perla","Perro","Persona","Pez","Piedra","Pino","Planta","Plátano","Plato","Pluma","Pollo","Potro","Problema","Profesor","Rama","Rancho","Regla","Rosa","Siembra","Soldado","Súbdito","Tablón","Tecla","Término","Vaca","Vecino","Vela","Vid","Yegua","Abecedario","Agrupación","Alameda","Almenaje","Alumnado","Andamiaje","Arboleda","Arenal","Armamento","Audiencia","Banco","Banda","Bandada","Bestiaje","Bibliografía","Cafetal","Cancionero","Cardume","Cargamento","Caserío","Chiquillería","Ciudadanía","Clan","Clero","Clientela","Colección","Colectividad","Comitiva","Contingente","Coral","Cuadrilla","Delegación","Dentadura","Documentación","Enjambre","Escuadrón","Estudiantado","Familia","Flota","Follaje","Fusilería","Gaterío","Gente","Harén","Hinchada","Hormiguero","Humanidad","Jauría","Léxico","Lista","Manada","Mobiliario","Montón","Muchachada","Muestrario","Mujerío","Novillada","Orquesta","Pedregal","Pelamen","Peonaje","Perlería","Piara","Pinar","Plantación","Platanal","Plumaje","Pollada","Potrada","Pradería","Problemática","Profesorado","Público","Racimo","Ramaje","Ranchería","Rebaño","Reglamento","Reparto","Reunión","Rosal","Rosaleda","Sembradío","Séquito","Tablonaje","Teclado","Tribu","Trío","Tropa","Utilería","Vacaje","Vajilla","Vajillo","Vecindario","Velamen","Viña","Viñedo","Vocabulario","Yeguada","Yegüería","Accidente","Agujero","Almohada","Año","Barco","Batalla","Caja","Canción","Casa","Cinta","Coche","Contratiempo","Cuaderno","Cuento","Dedo ","Detalle","Empresa","Encomienda","Excursión","Fantasma","Fotografía","Garza","Habitación","Herida","Hora","Imagen","Incidente","Lado","Lago","Máquina","Meme","Mesa","Minuto","Montaña","Niña","Nido","Queque","País","Paquete","Planeta","Poema","Ratón","Regalo","Reunión","Río","Sustantivo","Susto","Unicornio","Uña","Viaje","Aceite","Ácido","Agua","Aire","Alegría","Amor","Antipatía","Arena","Barro","Belleza","Calor","Cólera","Cooperación","Desagrado","Embriaguez","Entusiasmo","Esfuerzo","Éter","Fastidio","Fuego","Gas","Hambre","Harina","Inquina","Ira","Lava","Leche","Lluvia","Lujuria","Luz","Maldad","Miedo","Modestia","Monóxido","Necedad","Nostalgia","Odio","Oxígeno","Paciencia","Pereza","Rabia","Saliva","Sangre","Savia","Sed","Simpatía","Testarudez","Tiempo","Tinta","Tristeza","Ápice","Batiburrillo","Brizna","Centenar","Copa","Cuartel","Fajo","Gajo ","Gota","Grado","Gramo","Grano","Hatajo","Haz","Hora","Kilo","Lámina","Lasca","Litro","Loncha","Lonja","Mendrugo","Metro","Milímetro","Millar","Minutos","Mitad","Par","Pareja","Pedazo","Pellizco","Pizca","Porción","Puñado","Ramo","Rebanada","Ristra","Rodaja","Serie","Sucesión","Tajada","Taza","Terrón","Tramo","Trozo","Yunta","Agalla","Dedal","Jarra","Obelisco","Rascacielo","Alevín","Dedo","Jeque","Óboe","Reja","Amigo","Dinosaurio","Jugo","Ojo","Reloj","Anteojos","Dragón","Letra","Orzuelo","Rotonda","Balón","Edificio","Libro","Olla","Sabana","Bicicleta","Enfermera","Linterna","Palomar","Sol","Bombona","Escafandra","Luna","Pan","Suela","Budín","Estrella","Maceta","Pantalla","Tarjeta","Cachorro","Estropajo","Maleta","Pegaso","Tigre","Caramelo","Etiqueta","Mandolina","Perfume","Tobo","Castillo","Falange","Mano","Perro","Tocado","Ceniza","Falda","Moneda","Pestaña","Unicornio","Clavija","Flor","Musgo","Piedra","Uña","Cohete","Garganta","Nariz","Playa","Valla","Colmena","Gato","Neumático","Poema","Virus","Colonia","Gota","Novia","Prisión","Water","Consultorio","Guitarra","Nido","Quebrada","Xerocopia","Corona","Hierba","Nube","Queso","Yunta","Cucaracha","Hoja","Ñandú","Quincho","Zócalo","Cumbre","Huso","Ñame","Quinta","Zueco","Amor","Empatía","Jocundidad","Pedantería","Taciturnidad","Ambición","Entereza","Jugosidad","Pesadez","Tranquilidad","Ansiedad","Equidad","Justicia","Pesimismo","Terneza","Añoranza","Estupidez","Largueza","Poquedad","Terquedad","Audacia","Existencialismo","Lealtad","Pusilanimidad","Tontedad","Austeridad","Exquisitez","Lejanía","Querencia","Tranquilidad","Bajura","Falsedad","Lucidez","Quietud","Trivialidad","Beatitud","Fatalidad","Madurez","Racionalidad","Turgencia","Benevolencia","Felicidad","Magnanimidad","Relatividad","Turpitud","Bipolaridad","Fetidez","Maestría","Relevancia","Ubicuidad","Bondad","Generosidad","Munificencia","Rencor","Ultimidad","Calidad","Grandeza","Nobleza","Robustez","Unicidad","Carisma","Gravedad","Normalidad","Rubicundez","Unisonancia","Cautividad","Honradez","Nostalgia","Rusticidad","Untuosidad","Civilidad","Horribilidad","Nubilidad","Sabiduría","Vagarosidad","Contrariedad","Humildad","Nulidad","Sensatez","Valentía","Delicadeza","Idiotez","Objetividad","Serenidad","Valerosidad","Docilidad","Inequidad","Ociosidad","Sinuosidad","Virtuosismo","Ductilidad","Iracundia","Odio","Sororidad","Vulgaridad","Dureza","Irreverencia","Omnisciencia","Subjetividad","Zafiedad"],
    en: ["Ability","Access","Accident","Account","Act","Action","Activity","Actor","Ad","Addition","Address","Administration","Advantage","Advertising","Advice","Affair","Age","Agency","Agreement","Air","Airport","Alcohol","Ambition","Amount","Analysis","Analyst","Animal","Answer","Anxiety","Apartment","Appearance","Apple","Application","Appointment","Area","Argument","Army","Arrival","Art","Article","Aspect","Assignment","Assistance","Assistant","Association","Assumption","Atmosphere","Attempt","Attention","Attitude","Audience","Aunt","Average","Awareness","Back","Bad","Balance","Ball","Bank","Baseball","Basis","Basket","Bath","Bathroom","Bedroom","Beer","Beginning","Benefit","Bird","Birth","Birthday","Bit","Blood","Board","Boat","Body","Bonus","Book","Boss","Bottom","Box","Boy","Boyfriend","Bread","Breath","Brother","Building","Bus","Business","Buyer","Cabinet","Camera","Cancer","Candidate","Capital","Car","Card","Care","Career","Case","Cash","Cat","Category","Cause","Celebration","Cell","Championship","Chance","Chapter","Charity","Cheek","Chemistry","Chest","Chicken","Child","Childhood","Chocolate","Choice","Church","Cigarette","City","Class","Classroom","Client","Climate","Clothes","Coast","Coffee","Collection","College","Combination","Committee","Communication","Community","Company","Comparison","Competition","Complaint","Computer","Concept","Conclusion","Condition","Confusion","Connection","Consequence","Construction","Contact","Context","Contract","Contribution","Control","Conversation","Cookie","Country","County","Courage","Course","Cousin","Craft","Credit","Criticism","Culture","Currency","Customer","Cycle","Dad","Data","Database","Date","Day","Dealer","Death","Debt","Decision","Definition","Delivery","Demand","Department","Departure","Depression","Depth","Description","Design","Desk","Development","Device","Diamond","Difference","Difficulty","Dinner","Direction","Director","Dirt","Disaster","Discipline","Discussion","Disease","Disk","Distribution","Dog","Drama","Drawer","Drawing","Driver","Ear","Earth","Economics","Economy","Editor","Education","Effect","Efficiency","Effort","Egg","Election","Elevator","Emotion","Emphasis","Employee","Employer","Employment","End","Energy","Engine","Entertainment","Enthusiasm","Entry","Environment","Equipment","Error","Establishment","Estate","Event","Exam","Examination","Example","Exchange","Excitement","Exercise","Experience","Explanation","Expression","Extent","Eye","Face","Fact","Failure","Family","Farmer","Fat","Feature","Feedback","Field","Figure","Film","Finding","Fire","Fish","Flight","Focus","Food","Football","Force","Form","Fortune","Foundation","Frame","Freedom","Friendship","Fun","Funeral","Future","Game","Garbage","Garden","Gate","Gene","Gift","Girl","Girlfriend","Goal","Government","Grandmother","Grocery","Group","Growth","Guest","Guidance","Guide","Guitar","Hair","Half","Hall","Hand","Hat","Head","Health","Hearing","Heart","Heat","Height","Highway","Historian","History","Home","Homework","Honey","Hope","Hospital","Hotel","House","Housing","Ice","Idea","Image","Imagination","Impact","Importance","Impression","Improvement","Income","Independence","Indication","Industry","Inflation","Information","Initiative","Injury","Insect","Inside","Inspection","Inspector","Instance","Instruction","Insurance","Intention","Interaction","Interest","Internet","Introduction","Investment","Issue","Item","Job","Judgment","Key","Kind","King","Knowledge","Lab","Ladder","Lady","Lake","Language","Law","Leader","Leadership","Length","Level","Library","Life","Light","Line","Link","List","Literature","Location","Loss","Love","Machine","Magazine","Maintenance","Mall","Man","Management","Manager","Manufacturer","Map","Market","Marketing","Marriage","Material","Math","Matter","Meal","Meaning","Measurement","Meat","Media","Medicine","Medium","Member","Membership","Memory","Menu","Message","Metal","Method","Midnight","Mind","Mixture","Mode","Model","Mom","Moment","Money","Month","Mood","Morning","Mouse","Movie","Mud","Music","Name","Nation","Nature","Negotiation","Network","News","Newspaper","Night","Note","Nothing","Number","Object","Obligation","Office","Oil","Operation","Opinion","Opportunity","Orange","Order","Organization","Outcome","Outside","Oven","Owner","Page","Paint","Painting","Paper","Part","Passenger","Passion","Patience","Payment","Penalty","People","Percentage","Perception","Performance","Period","Permission","Person","Personality","Perspective","Philosophy","Phone","Photo","Physics","Piano","Picture","Pie","Piece","Pizza","Place","Plan","Platform","Player","Poem","Poet","Poetry","Point","Police","Policy","Politics","Pollution","Population","Position","Possession","Possibility","Post","Pot","Potato","Power","Practice","Preference","Preparation","Presence","Presentation","President","Pressure","Price","Priority","Problem","Procedure","Process","Product","Profession","Professor","Profit","Program","Promotion","Property","Proposal","Protection","Psychology","Purpose","Quality","Quantity","Queen","Question","Radio","Range","Rate","Ratio","Reaction","Reality","Reason","Reception","Recipe","Recognition","Recommendation","Record","Recording","Reflection","Refrigerator","Region","Relation","Relationship","Replacement","Republic","Reputation","Requirement","Research","Resolution","Resource","Response","Responsibility","Restaurant","Result","Revenue","Review","Revolution","Risk","River","Road","Rock","Role","Room","Rule","Safety","Salad","Salt","Sample","Satisfaction","Scale","Scene","School","Science","Screen","Secretary","Section","Sector","Security","Selection","Sense","Series","Service","Session","Setting","Shape","Share","Shirt","Side","Sign","Signature","Significance","Singer","Sir","Sister","Site","Situation","Size","Skill","Society","Software","Soil","Solution","Son","Song","Sound","Soup","Source","Space","Speaker","Speech","Sport","Square","Standard","Star","State","Statement","Steak","Step","Stock","Storage","Store","Story","Stranger","Strategy","Stress","Structure","Student","Studio","Study","Style","Subject","Success","Suggestion","Sun","Supermarket","Surgery","Sympathy","System","Table","Tale","Task","Tax","Tea","Teacher","Technology","Television","Temperature","Tennis","Tension","Term","Test","Thanks","Theory","Thing","Thought","Throat","Time","Tongue","Tool","Tooth","Top","Topic","Town","Trade","Tradition","Trainer","Training","Transportation","Truth","Two","Type","Uncle","Understanding","Union","Unit","University","User","Value","Variation","Variety","Vehicle","Version","Video","View","Village","Virus","Voice","Volume","War","Warning","Water","Way","Weakness","Wealth","Weather","Web","Wedding","Week","While","Wife","Wind","Winner","Woman","Wood","Word","Work","Worker","World","Writer","Writing","Year","Youth"]
}
const reloadBtn = document.getElementById("reload-btn");
const colorThief = new ColorThief();
var savedCanvas = {};

var currentLang;
if(window.localStorage.getItem("lang") == null){
    currentLang = "es";
    window.localStorage.setItem("lang","es");
} else {
    currentLang = window.localStorage.getItem("lang");
    document.getElementById("lang").value = currentLang;
}

function generate(){
    loadedCanvas = -1;
    reloadBtn.classList.add("spin");
    reloadBtn.onanimationend = () => {
        reloadBtn.classList.remove("spin");
    }
    for(let x = 0; x < cells.length; x++){
        if(cells[x].dataset.locked == 0){
            let seed = getRandomSeed();
            cells[x].style.backgroundImage = "url(https://picsum.photos/seed/" + seed + "/800.jpg)";
            cells[x].dataset.seed = seed;
            cells[x].querySelector(".cell-text").innerHTML = nouns[currentLang][Math.floor(Math.random()*nouns[currentLang].length)];
        }
    }
}

function toggleLock(cell, cellBtn){ // 0 = unlocked, 1 = locked
    if(cell.dataset.locked == 0){
        cell.dataset.locked = 1;
        cellBtn.innerHTML = '<i class="fas fa-lock"></i>';
    } else {
        cell.dataset.locked = 0;
        cellBtn.innerHTML = '<i class="fas fa-lock-open"></i>';
    }
    
}

function saveCanvas(){
    let currentCanvas = [];
    let loadedColors = 0;

    let loadBtn = document.createElement("div");
    loadBtn.className = "load-btn btn";
    document.getElementById("sidebar").appendChild(loadBtn);
    let colorGrid = document.createElement("div");
    colorGrid.className = "color-grid hidden";
    loadBtn.appendChild(colorGrid);
    let removeBtn = document.createElement("div");
    removeBtn.className = "remove-save";
    removeBtn.innerHTML = '<i class="fas fa-times"></i>';
    removeBtn.setAttribute("onclick","removeSavedCanvas(this.parentNode)");
    loadBtn.appendChild(removeBtn);

    for(let i = 0; i < cells.length; i++){
        currentCanvas.push([cells[i].querySelector(".cell-text").innerHTML,cells[i].dataset.seed]);
        
        let colorSquare = document.createElement("div");
        colorGrid.appendChild(colorSquare);
        let img = new Image();
        img.src = "https://picsum.photos/seed/" + cells[i].dataset.seed + "/100.jpg";
        img.crossOrigin = 'anonymous';
        img.addEventListener('load', function() {
            let color = colorThief.getColor(img);
            colorSquare.style.background = `rgb(${color[0]},${color[1]},${color[2]})`
            colorSquare.dataset.seed = cells[i].dataset.seed;
            loadedColors++;

            if(loadedColors >= 6){
                colorGrid.classList.remove("hidden");
            }
        });
        
    }
    let saveIndex = getRandomSeed();
    savedCanvas[saveIndex] = currentCanvas;
    loadBtn.dataset.index = saveIndex;
    loadBtn.setAttribute("onclick","loadCanvas('" + (saveIndex) + "')");

    console.log(savedCanvas);
}

var loadedCanvas = -1;
function loadCanvas(index){
    if(loadedCanvas != index){
        loadedCanvas = index;
        for(let x = 0; x < cells.length; x++){
            cells[x].style.backgroundImage = "url(https://picsum.photos/seed/" + savedCanvas[index][x][1] + "/800.jpg";
            cells[x].querySelector(".cell-text").innerHTML = savedCanvas[index][x][0];
            cells[x].dataset.locked = 0;
            cells[x].querySelector(".pin-btn").innerHTML = '<i class="fas fa-lock-open"></i>';
        }
    }
}

function removeSavedCanvas(node){
    delete savedCanvas[node.dataset.index];
    console.log(savedCanvas);
    node.remove();
}

function changeLang(event){
    currentLang = event.target.value;
    window.localStorage.setItem('lang',currentLang);
    generate();
}

function getRandomSeed(){
    const letters = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÇ";

    var password = '';
    for(let i = 0; i < 4; i++){
        switch(Math.floor(Math.random()*3) + 1){
            case 1: // uppercase
                var upperIndex = Math.floor(Math.random()*letters.length);
                password += letters[upperIndex];
                break;
            case 2: // lowercase
                var lowerIndex = Math.floor(Math.random()*letters.length);
                password += letters[lowerIndex].toLowerCase();
                break;
            case 3: // number
                var randNum = Math.floor(Math.random()*10)
                password += randNum;
                break;
        }
    }
    return password;
}