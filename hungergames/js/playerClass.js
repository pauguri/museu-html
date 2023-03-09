class Player {
    static stateColors = {
        scared: "#3937a6",
        crazy: "#803d74",
        hungry: "#80503d",
        diseased: "#4c6932",
        wounded: "#695f32"
    }

    // base stats
    hunger = 0.5; strength = 0.5; sanity = 0.5; mood = 0.5;
    food = 3; medicine = 0; weapon = 0;
    
    deceased = false;
    killingChance = 0.1;
    deathChance = 0;
    scaredChance = 0.05;
    dropSent = false;
    eventText = '';

    constructor(name,district) {
        this.name = name;
        this.district = district;
        this.states = {
            scared: false,
            crazy: false,
            hungry: false,
            diseased: false,
            wounded: false
        }
        this.previousVitals = {
            hunger: 0.5,
            strength: 0.5,
            sanity: 0.5,
            mood: 0.5,
        }
        this.previousItems = {
            food: 3,
            medicine: 0,
            weapon: 0
        }
    }

    static kill(killer, victim){
        victim.die();
        killer.food += victim.food;
        killer.medicine += victim.medicine;
        killer.weapon += victim.weapon;
        victim.food = 0;
        victim.medicine = 0;
        victim.weapon = 0;
        let smText = SM.get('KILL');
        killer.eventText = smText[0].replace('$k',killer.name).replace('$v',victim.name);
        victim.eventText = smText[1].replace('$k',killer.name).replace('$v',victim.name);
    }

    chance(percent) {
        return Math.random() < percent;
    }

    tryToEat(){
        if(this.food > 0 && !this.states.diseased) {
            this.food -= 1;
            this.hunger = clamp(this.hunger + 0.2);
            this.mood = clamp(this.mood + 0.1);
            this.strength = clamp(this.strength + 0.3);
            this.sanity = clamp(this.sanity + 0.05);
            this.states.hungry = false;
        }
        
    }

    die(cause){
        for(let state in this.states){
            this.states[state] = false;
        }
        this.deceased = true;
        alivePlayers.splice(alivePlayers.indexOf(this),1);
        if(!loggedPlayers.includes(this)){
            loggedPlayers.push(this);
        }
        if(cause !== undefined && cause !== null){
            this.eventText = this.name + SM.get('DIE_' + cause);
        }
    }

    tryForEvents() { // returns true if player killed anyone

        if(this.chance(this.deathChance)){ // DEATH
            this.die('DISEASE');
        } else if(this.dropSent){ // GET DROP
            this.eventText = this.name + SM.get('GET_DROP');
            this.medicine += 1;
            this.food += 2;
            this.mood = clamp(this.mood + 0.4);
            this.sanity = clamp(this.sanity + 0.5);
        } else if(this.chance(this.killingChance)){ // KILL
            if(this.weapon > 0) { this.weapon -= 1; }
            this.killingChance = 0;
            this.sanity = clamp(this.sanity - 0.3);
            if(this.chance(0.5)) { this.mood = clamp(this.mood - 0.25); }
            return true;
        } else {
            let rand = Math.random();
                if(rand < 0.6) { // RANDOM
                    this.eventText = this.name + SM.get('RANDOM');

                } else if(rand < 0.75) { // HUNT
                    if(this.chance(this.strength)){
                        let smText = SM.get('HUNT');
                        this.eventText = this.name + smText[0];
                        this.strength = clamp(this.strength - 0.5);
                        this.food += 2;
                        if(this.chance(0.2)){ 
                            this.states.wounded = true; 
                            this.eventText += smText[1];
                        }
                        this.eventText += '.';
                    } else {
                        this.eventText = this.name + SM.get('HUNT_FAIL');
                    }
                } else if(rand < 0.83) { // GET WEAPON
                    this.eventText = this.name + SM.get('GET_WEAPON');
                    this.sanity = clamp(this.sanity - 0.2);
                    this.weapon += 1;

                } else if(rand < 0.92) { // GET HURT
                    this.eventText = this.name + SM.get('GET_HURT');
                    this.states.wounded = true;
                    this.strength = clamp(this.strength - 0.25);
                    this.mood = clamp(this.mood - 0.15);
                } else { // GET ILL
                    this.eventText = this.name + SM.get('GET_ILL');
                    this.states.diseased = true;
                    this.strength = clamp(this.strength - 0.3);
                    this.mood = clamp(this.mood - 0.25);
                }
        }
        return false;
    }

    executeStates() {
        // always on states
        if(this.chance(clamp(this.scaredChance+(Math.abs(1-this.mood)/3)))) { this.states.scared = true; }
        if(this.hunger <= 0){ this.states.hungry = true; }
        if(this.sanity <= 0) { this.states.crazy = true; }
        if(this.mood <= 0 && this.chance(0.5)) { this.die('SUICIDE') }
        this.killingChance = 0.1;

        if(this.states.scared) {
            this.states.crazy = false;
            this.killingChance = 0;
            this.mood = clamp(this.mood - 0.1);
            this.sanity = clamp(this.sanity - 0.05);
            this.eventText += SM.get('GET_SCARED');
        }
        if(this.states.crazy) {
            this.states.scared = false;
            this.killingChance = 0.8;
            this.mood = clamp(this.mood + 0.2);
            this.eventText += SM.get('GET_CRAZY');
        }
        if(this.states.hungry) {
            this.killingChance = 0;
            this.strength = clamp(this.strength - 0.1);
            if(this.chance(0.25)) { this.die('HUNGER') }
        }
        if(this.states.diseased) {
            if(this.medicine > 0) {
                this.medicine -= 1;
                this.states.diseased = false;
                if(this.eventText.includes('disease')){
                    this.eventText += SM.get('CURE_INSTANTLY');
                } else {
                    this.eventText += SM.get('CURE');
                }
            } else {
                this.killingChance = 0;
                this.deathChance = 0.25;
                this.mood = clamp(this.mood - 0.1);
                this.strength = clamp(this.strength - 0.05);
            }
        }
        if(this.states.wounded) {
            this.killingChance = this.killingChance/2;
            this.deathChance = clamp(this.deathChance + 0.02);
            this.strength = clamp(this.strength - 0.05);
        }

        this.killingChance = clamp(this.killingChance + (0.05*this.weapon));
    }

    dayEnd() {
        console.log(this.previousVitals.hunger + ' ' + this.hunger);
        this.previousVitals.hunger = this.hunger;
        this.previousVitals.strength = this.strength;
        this.previousVitals.sanity = this.sanity;
        this.previousVitals.mood = this.mood;
        this.previousItems.food = this.food;
        this.previousItems.weapon = this.weapon;
        this.previousItems.medicine = this.medicine;

        if(this.states.scared && this.chance(0.25)) { this.states.scared = false; }
        if(this.states.crazy && this.chance(0.25)) { this.states.crazy = false; }
        if(this.states.wounded && this.chance(0.2)) { this.states.wounded = false; }
        if(this.states.diseased && this.chance(0.1)) { this.states.diseased = false; }
        this.hunger = clamp(this.hunger - 0.1);
        this.dropSent = false;
    }
}