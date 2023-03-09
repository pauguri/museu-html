var darkMode = false;
const root = document.documentElement;
const knob = document.querySelector('#switch-knob');

var date = new Date();
 var hour = date.getHours();

 if(hour >= 8 && hour < 19){
    darkMode = false;
} else {
    darkMode = true;
}
updateMode();

function toggleMode(){
    darkMode = !darkMode;
    updateMode();
}

function updateMode(){
    if(!darkMode){
        root.style.setProperty('--bgc','#ffffff');
        root.style.setProperty('--txc','#000000');
        knob.setAttribute('class', 'switch-knob left');
    } else {
        root.style.setProperty('--txc','#ffffff');
        root.style.setProperty('--bgc','#000000');
        knob.setAttribute('class', 'switch-knob right');
    }
}

function formSubmit() {
    const email = document.querySelector('#email').value;
    const formInfo = document.querySelector('.form-info');
    const form = document.forms[0];

    formInfo.style.display = "block";
    formInfo.classList.remove('text-fade');
    formInfo.classList.add('text-fade');
    formInfo.innerHTML = `Success! ${email} will be notified of future updates`;
    form.style.display = "none";
}