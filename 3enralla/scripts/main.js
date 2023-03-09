const root = document.documentElement;
const xc = document.getElementById('xc');
const cc = document.getElementById('cc');
const board = document.getElementsByClassName('cell');
//const winningBar = document.querySelector('.winning-bar');
var xTurn = true;
var boardArray = ['','','','','','','','',''];
//var winningBarPos;

window.addEventListener('mousemove',(m) => {
    root.style.setProperty('--mousey', m.clientY + 'px');
    root.style.setProperty('--mousex', m.clientX + 'px');
});

function startGame(){
    xTurn = true;
    cc.style.opacity = '0';
    xc.style.opacity = '1';
    document.body.style.pointerEvents = 'all';
}

function placePiece(p){
    if(boardArray[p.id] == ''){
        if(xTurn){
            boardArray[p.id] = 'X';
            cc.style.opacity = '1';
            xc.style.opacity = '0';
        } else {
            boardArray[p.id] = 'O';
            cc.style.opacity = '0';
            xc.style.opacity = '1';
        }
        
        console.log(boardArray);
        printBoard();
        if(checkWinner()){
            document.body.style.pointerEvents = 'none';
            /*createBar();*/
            if(xTurn){
                document.body.style.backgroundColor = '#f25f55';
            } else {
                document.body.style.backgroundColor = '#5577f2';
            }
            setTimeout(resetGame, 2000);
        } else if(!boardArray.includes('')){
            document.body.style.pointerEvents = 'none';
            setTimeout(resetGame, 2000);
        }
        xTurn = !xTurn;
    }
    
}

function printBoard(){
    for(let i = 0; i<board.length; i++){
        if(boardArray[i] == 'X'){
            board[i].innerHTML = '<ion-icon name="close"></ion-icon>';
            board[i].style.backgroundColor = '#f25f55';
        } else if(boardArray[i] == 'O'){
            board[i].innerHTML = '<ion-icon name="radio-button-off"></ion-icon>';
            board[i].style.backgroundColor = '#5577f2';
        } else {
            board[i].innerHTML = '';
        }
    }
}

function checkWinner(){
    for(let x = 0; x<3; x++){
        if(boardArray[x*3] == boardArray[(x*3)+1] && boardArray[x*3] == boardArray[(x*3)+2] && boardArray[x*3] != ''){
            //winningBarPos = 'r' + x;
            return true;
        } else if(boardArray[x] == boardArray[x+3] && boardArray[x] == boardArray[x+6] && boardArray[x] != ''){
            //winningBarPos = 'c' + x;
            return true;
        }
    }
    if(boardArray[0] == boardArray[4] && boardArray[0] == boardArray[8] && boardArray[4] != ''){
        //winningBarPos = 'd0';
        return true;
    } else if (boardArray[2] == boardArray[4] && boardArray[2] == boardArray[6] && boardArray[4] != '') {
        //winningBarPos = 'd1';
        return true;
    } else {
        return false;
    }
}

/*function createBar(){
    var direction = winningBarPos.charAt(0);
    var num = winningBarPos.charAt(1);
    console.log(winningBarPos + ' ' + direction + num);
    winningBar.style.opacity = '1';
    switch(direction){
        case 'r':
            winningBar.style.width = '200vw';
            winningBar.style.height = '30%';
            winningBar.style.left = '-100%';
            winningBar.style.top = 33*num + '%';
            break;
        case 'c':
            winningBar.style.width = '30%';
            winningBar.style.height = '200vh';
            winningBar.style.left = 33*num + 2 + '%';
            winningBar.style.top = '-100%';
            break;
        case 'd':
            winningBar.style.opacity = '0';
            winningBar.style.width = '200vw';
            winningBar.style.height = '30%';
            winningBar.style.left = '0';
            winningBar.style.top = '0';
            winningBar.style.transform = 'rotate(-45deg)';
            break;

    }
    winningBar.style.backgroundColor = xTurn ? '#f25f55' : '#5577f2';
}*/

function resetGame(){
    for(let i = 0; i<board.length; i++){
        boardArray[i] = '';
        board[i].innerHTML = '';
        board[i].style.backgroundColor = 'rgba(0,0,0,0.2)';
        document.body.style.backgroundColor = 'burlywood';
    }
    /*winningBar.style.opacity = '0';*/
    startGame();
}