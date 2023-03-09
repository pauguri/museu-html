var goalDate;
//from date & time selection to countdown transition
function createCountdown(form) {
    var rawGoalDate = form.elements[0].value + 'T' + form.elements[1].value;
    goalDate = new Date(rawGoalDate);
    document.querySelector('.avia-dels-ous').style.display = 'none';
    document.querySelector('.mare-dels-ous').style.display = 'flex';
    
    setInterval(countdown,1000);
}

//countdown
function countdown() {
    var dif = Math.floor(goalDate - new Date())/1000;
    var verb = document.getElementById('verb')
    verb.innerText = dif<=(-1) ? 'Han transcorregut' : dif>=1 ? 'Resten' : 'AIXÒ ÉS ARA!!!';
    verb.style.fontSize = dif>-1 && dif<1 ? '50px' : '';

    dif=Math.abs(dif)
    var d = Math.floor(dif/(24*3600));
    var h = Math.floor(dif/3600)%24;
    var m = Math.floor((dif/60)%60);
    var s = Math.floor(dif%60);
     
    document.querySelector('#days .gran-numero').innerText = d;
    document.querySelector('#hours .gran-numero').innerText = toTwoDigits(h);
    document.querySelector('#minutes .gran-numero').innerText = toTwoDigits(m);
    document.querySelector('#seconds .gran-numero').innerText = toTwoDigits(s);
    
    document.querySelector('#days .sub-tag').innerText = d == 1 ? 'Dia' : 'Dies';
    document.querySelector('#hours .sub-tag').innerText = h == 1 ? 'Hora' : 'Hores';
    document.querySelector('#minutes .sub-tag').innerText = m == 1 ? 'Minut' : 'Minuts';
    document.querySelector('#seconds .sub-tag').innerText = s == 1 ? 'Segon' : 'Segons';
}

//imposing 2 digits on hours, minutes and seconds
function toTwoDigits(n){
    return n < 10 && n > -10 ? '0' + n : n;
}



