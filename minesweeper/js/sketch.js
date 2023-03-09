class Cell {
    constructor(x,y,size){
        this.x = x;
        this.y = y;
        this.size = size;
        this.hasMine = random() <= mineChance ? true : false;
        this.revealed = false;
        this.flagged = false;
        this.neighbourMines = 0;
    }
    
    render() {
        noFill();
        square(this.x,this.y, this.size);
        if(this.revealed){
            fill(0);

            if(this.hasMine){
                fill(255,0,0);
                square(this.x, this.y, this.size);
                fill(0);
                circle(this.x + this.size/2,this.y + this.size/2,this.size/2);
            } else {
                fill(155);
                square(this.x, this.y, this.size);
                if(this.neighbourMines > 0) {
                    fill(0);
                    textSize(20);
                    textAlign(CENTER,CENTER);
                    text(this.neighbourMines, this.x + this.size/2, this.y + this.size/2);
                }
            }
        } else if(this.flagged){
            fill(0,255,0);
            square(this.x,this.y, this.size);
        }
    }

    reveal(){
        if(!this.flagged){
            this.revealed = true;
        }
    }

    toggleFlag(){
        if(!this.revealed){
            this.flagged = !this.flagged;
        }
    }

    positionInsideCell(x,y){
        return (x > this.x && x < this.x + this.size && y > this.y && y < this.y + this.size);
    }
}

const cellSize = 40;
const mineChance = 0.1;
var rows, cols, grid;

function setup(){
    createCanvas(400,400);
    canvas.oncontextmenu = function(e) { e.preventDefault(); e.stopPropagation(); }

    rows = floor(width / cellSize);
    cols = floor(height / cellSize);
    grid = make2DArray(cols, rows);

    for(let i = 0; i < cols; i++){
        for(let j = 0; j < rows; j++){
            grid[i][j] = new Cell(i*cellSize, j*cellSize, cellSize);
        }
    }
    for(let i = 0; i < cols; i++){
        for(let j = 0; j < rows; j++){
            setNeighbourMines(grid[i][j],i,j);
        }
    }
}

function setNeighbourMines(cell,cellI,cellJ){
    for(let i = -1; i <= 1; i++){
        for(let j = -1; j <= 1; j++){
            if(cellI+i >= 0 && cellI+i < cols && cellJ+j >= 0 && cellJ+j < rows){
                if(grid[cellI+i][cellJ+j].hasMine){
                    cell.neighbourMines++;
                }
            }
            
        }
    }
}

function draw() {
    background(255);
    for(let i = 0; i < cols; i++){
        for(let j = 0; j < rows; j++){
            grid[i][j].render();
        }
    }
}

function mousePressed(){
    for(let i = 0; i < cols; i++){
        for(let j = 0; j < rows; j++){
            if(grid[i][j].positionInsideCell(mouseX, mouseY)){
                if (mouseButton === LEFT) {
                    revealCell(i,j);
                }
                if (mouseButton === RIGHT) {
                    grid[i][j].toggleFlag();
                }
            }
        }
    }
}

function revealCell(cellI, cellJ){
    let cell = grid[cellI][cellJ];
    if(!cell.revealed){
        if(!cell.hasMine){
            cell.reveal();
            if(cell.neighbourMines == 0){
                for(let i = -1; i <= 1; i++){
                    for(let j = -1; j <= 1; j++){
                        if(cellI+i >= 0 && cellI+i < cols && cellJ+j >= 0 && cellJ+j < rows){
                            revealCell(cellI+i,cellJ+j);
                        }
                    }
                }
            }
        } else {
            revealAll();
        }
    }
}

function revealAll(){
    for(let i = 0; i < cols; i++){
        for(let j = 0; j < rows; j++){
            if(!grid[i][j].revealed){
                grid[i][j].flagged = false;
                grid[i][j].reveal();
            }
        }
    }
}

function make2DArray(cols, rows) {
    let arr = new Array(cols);
    for(let i = 0; i < arr.length; i++){
        arr[i] = new Array(rows);
    }

    return arr;
}