var SM = {
    get: function(key) {
        return this[lang][key][Math.floor(Math.random()*this[lang][key].length)];
    },
    en: {
        PAGE_TITLE: "*realistic* HG Simulator",
        TITLE: "<span style='font-style: oblique; font-weight: normal;'>realistic</span> Hunger Games Simulator",
        TRIBUTE_COUNT: "Number of tributes:",
        INSTRUCTIONS: "Input the tributes' names.",
        MALE_NAME: "District $n Male",
        FEMALE_NAME: "District $n Female",
        AGE_WARNING: "I am 13 or older",
        START_BUTTON: "Start the Games",
        NEXT_BUTTON: "NEXT DAY",
        WINNER_BUTTON: "WE HAVE A WINNER",
        WINNER: "WINNER",
        RESTART_BUTTON: "New Game",
        DAY: "Day ",
        VITALS: "VITALS",
        INVENTORY: "INVENTORY",
        HUNGER: "Nutrition",
        STRENGTH: "Strength",
        SANITY: "Sanity",
        MOOD: "Mood",
        FOOD: "Food",
        WEAPONS: "Weapons",
        MEDICINE: "Medicine",
        STATES: {
            scared: "scared",
            crazy: "crazy",
            hungry: "hungry",
            diseased: "diseased",
            wounded: "wounded",
            deceased: "deceased"
        },

        RANDOM: [
            " has been doing random stuff."
        ],
        HUNT: [
            [" has gone hunting for food"," and got badly injured"]
        ],
        HUNT_FAIL: [
            " tried to go hunting for food but wasn't strong enough."
        ],
        GET_WEAPON: [
            " has manufactured a weapon.",
            " has found a weapon laying between the bushes."
        ],
        GET_HURT: [
            " has been injured."
        ],
        GET_DROP: [
            " has recieved a drop with food and medicine, lucky for them."
        ],
        GET_ILL: [
            " has contracted a disease."
        ],
        GET_SCARED: [
            " They are scared."
        ],
        GET_CRAZY: [
            " They have gone crazy."
        ],
        KILL: [
            ["<span style='color: #f05e5e'>$k has killed $v</span> with a wooden spear","<span style='color: #f05e5e'>$v has been killed by $k</span> with a wooden spear."]
        ],
        DIE_DISEASE: [
            " <span style='color: #f05e5e'>has died</span> of a disease."
        ],
        DIE_SUICIDE: [
            " <span style='color: #f05e5e'>has commited suicide</span>."
        ],
        DIE_HUNGER: [
            " <span style='color: #f05e5e'>has died</span> of starvation."
        ],
        CURE_INSTANTLY: [
            " Luckily, they had medicine and were able to be cured."
        ],
        CURE: [
            " They have cured their disease with the medicine they received."
        ]
    },
    ca: {
        PAGE_TITLE: "Simulador *realista* dels JdlF",
        TITLE: "Simulador <span style='font-style: oblique; font-weight: normal;'>realista</span> dels Jocs de la Fam",
        TRIBUTE_COUNT: "Nombre de tributs:",
        INSTRUCTIONS: "Escriu els noms dels tributs.",
        MALE_NAME: "Home del Districte $n",
        FEMALE_NAME: "Dona del Districte $n",
        AGE_WARNING: "Tinc 13 anys o més",
        START_BUTTON: "Començar els Jocs",
        NEXT_BUTTON: "SEGÜENT DIA",
        WINNER_BUTTON: "TENIM GUANYADOR",
        WINNER: "HA GUANYAT",
        RESTART_BUTTON: "Nous Jocs",
        DAY: "Dia ",
        VITALS: "VITALS",
        INVENTORY: "INVENTARI",
        HUNGER: "Nutrició",
        STRENGTH: "Fortalesa",
        SANITY: "Seny",
        MOOD: "Ànims",
        FOOD: "Menjar",
        WEAPONS: "Armes",
        MEDICINE: "Medicaments",
        STATES: {
            scared: "espantat",
            crazy: "embogit",
            hungry: "afamat",
            diseased: "malalt",
            wounded: "ferit",
            deceased: "mort"
        },

        RANDOM: [
            " ha estat donant voltes al voltant d'un arbre.",
            " ha construït una canya de pescar, amb la mala sort que li ha caigut a l'aigua i se n'ha anat riu avall.",
            " s'ha quedat al seu refugi tot el dia.",
            " ha anat a explorar el bosc per buscar recursos, sense èxit.",
            " ha perseguit un animal per intentar caçar-lo, però l'animal ha sigut més ràpid.",
            " ha intentat construïr un arc, però la branca no parava de trencar-se-li i ha hagut de desistir.",
            " ha estat buscant un refugi, i ha trobat una petita cova on passar la nit.",
            " ha estat buscant un refugi, i ha trobat una clariana amb bona visió on passar la nit.",
            " ha estat buscant un refugi, però no ha tingut sort, i haurà de dormir al mig del bosc.",
            " ha estat buscant un refugi, i al final ha optat per enfilar-se a un arbre i passar la nit allà.",
            " ha estat buscant un lloc elevat on passar la nit.",
            " no ha estat fent res particularment interessant.",
            " ha estat itentant pescar, sense èxit.",
            " ha estat investigant la zona i identificant les posicions dels altres tributs."
        ],
        HUNT: [
            [" ha recollit unes mores d'un boix",", però les espines del boix li han provocat algunes ferides"],
            [" ha construït una canya de pescar i ha aconseguit una mica de peix",", però una piranya ha saltat de l'aigua i l'ha mossegat al braç"],
            [" ha trobat un campament amb menjar i ha robat tot el que li cabia a les mans",". Per desgràcia, ha sigut descobert i els propietaris del menjar l'han apedregat fins que ha fugit"],
            [" ha caçat un porc senglar",", però durant la persecució s'ha rascat les cames amb els arbustos del bosc"]
        ],
        HUNT_FAIL: [
            " ha intentat anar a caçar però està massa dèbil, necessita descansar.",
            " necessita anar a buscar menjar, però no té prous forces per fer-ho."
        ],
        GET_WEAPON: [
            " ha construït un arc.",
            " ha trobat una llança amagada entre els arbustos.",
            " ha construït una ballesta improvisada.",
            " ha construït un tiraxines.",
            " ha afilat unes roques per fer fletxes."
        ],
        GET_HURT: [
            " ha intentat construïr un arc, però la corda s'ha trencat i la branca que l'aguantava ha sortit disparada cap a la seva cara.",
            " ha caigut mentres corria i s'ha fet ferides a les mans i els genolls.",
            " ha rebut un atac a distància d'un altre tribut. No ha mort però ha quedat greument ferit.",
            " s'ha tallat amb una pedra afilada mentres construïa una llança.",
            " ha relliscat i ha caigut pendent avall.",
            " ha patit cremades severes per estar tantes hores al sol."
        ],
        GET_DROP: [
            " ha rebut un paquet amb menjar i medicaments."
        ],
        GET_ILL: [
            " ha menjat una mora silvestre verinosa i ha emmalaltit.",
            ", a causa d'una ferida infectada, ha emmalaltit."
        ],
        GET_SCARED: [
            " Té por."
        ],
        GET_CRAZY: [
            " Ha embogit."
        ],
        KILL: [
            ["<span style='color: #f05e5e'>$k ha matat a $v</span>.","<span style='color: #f05e5e'>$v ha mort a mans de $k</span>."]
        ],
        DIE_DISEASE: [
            " <span style='color: #f05e5e'>ha mort</span> per una malaltia."
        ],
        DIE_SUICIDE: [
            " <span style='color: #f05e5e'>s'ha suïcidat</span>."
        ],
        DIE_HUNGER: [
            " <span style='color: #f05e5e'>ha mort</span> de gana."
        ],
        CURE_INSTANTLY: [
            " Per sort, tenia medicaments i s'ha pogut recuperar."
        ],
        CURE: [
            " Han curat la seva malaltia amb els medicaments que han rebut."
        ]
    },
}