const letters = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÇ";
const symbols = ".,-:;_!$%&/()=?¿¡+*[]{}#";

function generatePassword(form) {
    document.getElementById('alerta').innerText = '';
    var formElements = form.elements;
    console.log(formElements);
    var len = formElements['len'].value;
    
    var checkedTypes = [];
    for (let i=1; i<5; i++) {
        if(form.elements[i].checked){
            checkedTypes.push(i);
        }
    }
    if (checkedTypes.length == 0) {
        checkedTypes=[1,2,3,4]
        document.getElementById('alerta').innerText = 'REDIANTRE! Manca la sel·lecció de caselles fill de puta!'
    }

    var password = '';
    for(let i = 0; i < len; i++){
        var characterTypeIndex = Math.floor(Math.random()*checkedTypes.length);
        switch(checkedTypes[characterTypeIndex]){
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
            case 4: // symbol
                var symbolIndex = Math.floor(Math.random()*symbols.length);
                password += symbols[symbolIndex];
                break;
        }
    }
    document.getElementById('password').innerText = password;
    document.getElementById('password-container').style.display = 'block';
}

function copyToClipboard() {
    if(clipboard in navigator){
        navigator.clipboard.writeText(document.getElementById('password').innerText);
    } else {
        alert('Quin navegador em portes cabron que no es pot ni copiar')
    }
    
}