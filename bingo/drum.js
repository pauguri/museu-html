const ball = document.getElementById('ball');
const dealed = document.getElementById('dealed-container');
var numbers = Array.from(Array(75).keys());
var dealedBalls = [];

function generateBall(){
    if(ball.classList.contains('dealed') || numbers.length <= 0) { return; }

    ball.style.display = '';
    
    let randIndex = Math.floor(Math.random() * numbers.length);
    let chosenNumber = numbers[randIndex] + 1;
    let color = `hsl(${mapToColor(chosenNumber)},100%,50%)`;
    numbers.splice(randIndex, 1);

    ball.innerHTML = chosenNumber;
    document.documentElement.style.setProperty('--ball-color',color);
    ball.classList.add('dealed');
    ball.onanimationend = () => {
        ball.classList.remove('dealed');
    }

    dealed.innerHTML = '';
    dealedBalls.push([chosenNumber, color]);
    dealedBalls.sort((a,b) => { return a[0] - b[0]; });
    dealedBalls.forEach(ball => {
        let div = document.createElement('div');
        div.className = 'mini-ball';
        div.style.setProperty('--border',ball[1]);
        div.innerHTML = ball[0];
        dealed.appendChild(div);
    })
}

let mapToColor = (n) => {
    return (n*360)/75;
}