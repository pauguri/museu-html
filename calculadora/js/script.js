var screenNum = '0';
var dotPressed = false;
var firstEqual = true;
var operator = '';
var a = 0;
var b = 0;

function eraseThisMF(){
    screenNum = "";
    a = 0;
    operator = '';
    var highKeys = document.getElementsByClassName("key highlight");
    for (const i in highKeys){
        highKeys[i].className = "key";
    }
    firstEqual = true;
    printNum();
}

function setNumber(num){
    if(screenNum == 0){
        if(dotPressed === true){
            screenNum = "0." + num;
            dotPressed = false;
        } else {
            screenNum = num;
        }
        
    } else if (screenNum.length >= 11){
        alert("No caben mas numeros ostia");
    } else {
        if(dotPressed === true){
            screenNum = "" + screenNum + "." + num;
            dotPressed = false;
        } else {
            screenNum = "" + screenNum + num;
        }
        
    }
    printNum();
}

function setDot(){
    dotPressed = true;
}

function calc(inputSign){
    if(inputSign === '-' && screenNum == 0){
        screenNum = '-';
    } else {
        if(operator != ''){
            getResult();
        }
        operator = inputSign;
        a = screenNum==0?0:parseFloat(screenNum);
        screenNum = 0;
        document.getElementById(inputSign).className = "key highlight";
    }

}

function equal(){
    getResult();
    firstEqual = false;
}

function getResult(){
    if (operator != ''){
        if (firstEqual == true){
            b = parseFloat(screenNum);
            switch(operator){
                case '+':
                    screenNum = a + b;
                    break;
                case '-':
                    screenNum = a - b;
                    break;
                case '*':
                    screenNum = a * b;
                    break;
                case '/':
                    screenNum = a / b;
                    break;
                default:
                    screenNum = 0;
            }
        } else {
            switch(operator){
                case '+':
                    screenNum += b;
                    break;
                case '-':
                    screenNum -= b;
                    break;
                case '*':
                    screenNum *= b;
                    break;
                case '/':
                    screenNum /= b;
                    break;
                default:
                    screenNum = 0;
            }
        }
        
        screenNum = +screenNum.toFixed(10);
        var highKeys = document.getElementsByClassName("key highlight");
        for (let i in highKeys){
            highKeys[i].className = "key";
        }
        printNum();
    }
}

function printNum(){
    document.getElementById('screen').innerHTML = screenNum;
}

