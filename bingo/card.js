// FIT TEXT
const isOverflown = ({ clientWidth, clientHeight, scrollWidth, scrollHeight }) => (scrollWidth > clientWidth) || (scrollHeight > clientHeight)
const resizeText = ({ element, elements, minSize = 10, maxSize = 512, step = 1, unit = 'px' }) => {
    (elements || [element]).forEach(el => {
        let i = minSize
        let overflow = false

        const parent = el.parentNode

        while (!overflow && i < maxSize) {
            document.documentElement.style.setProperty('--fs',`${i}${unit}`);
            overflow = isOverflown(parent)

            if (!overflow) i += step
        }

        // revert to last state where no overflow happened
        document.documentElement.style.setProperty('--fs',`${i - step}${unit}`);
    })
}

function fitAllText(){
    resizeText({
    element: document.getElementById('fit-reference'),
    step: 0.25
    })
}

// CARD
const fillableCells = document.querySelectorAll('.fillable');
function generateCard(){
    fitAllText();
    window.addEventListener('resize', fitAllText);
    
    fetch('./numbers.json')
        .then(response => response.json())
        .then(data => {
            let numbers = data["75"];

            fillableCells.forEach(cell => {
                let col = cell.dataset.column;
                let randIndex = Math.floor(Math.random() * numbers[col].length);
                cell.innerHTML = numbers[col][randIndex];
                numbers[col].splice(randIndex,1);

                cell.addEventListener('click', toggleCellCover);
            })
        })
}

function toggleCellCover(event){
    event.target.classList.toggle('covered');

    if(document.querySelectorAll('.covered').length === fillableCells.length) {
        console.log('BINGO!');
    }
}