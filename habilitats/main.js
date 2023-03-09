const boxes = document.getElementsByTagName('a');
var coords = [];

window.addEventListener('resize', regenerate);

function generate(){
    console.log(boxes);
    for(let i=0; i<boxes.length; i++){
        coords.push([Math.random()*(window.innerHeight-200),Math.random()*(window.innerWidth-200),(Math.random()*3)+0.5]);
        boxes[i].style.top = coords[i][0] + 'px';
        boxes[i].style.left = coords[i][1] + 'px';
    }
    animate();
}

function regenerate(){
    for(let i=0; i<boxes.length; i++){
        coords[i] = [Math.random()*(window.innerHeight-200),Math.random()*(window.innerWidth-200),coords[i][2]];
        // boxes[i].style.top = coords[i][0] + 'px';
        // boxes[i].style.left = coords[i][1] + 'px';
    }
}

function animate(){
    window.requestAnimationFrame(animate);
    for(let i=0; i<boxes.length; i++){
        let element = boxes[i];

        if(coords[i][0]<=0){
            element.dataset.down = true;
        } else if(coords[i][0]>=(window.innerHeight-200)){
            element.dataset.down = false;
        }
        if(element.dataset.down == 'true'){
            coords[i][0] += coords[i][2];
        } else {
            coords[i][0] -= coords[i][2];
        }
        element.style.top = coords[i][0] + 'px';

        if(coords[i][1]<=0){
            element.dataset.right = true;
        } else if(coords[i][1]>=(window.innerWidth-200)){
            element.dataset.right = false;
        }
        if(element.dataset.right == 'true'){
            coords[i][1] += coords[i][2];
        } else {
            coords[i][1] -= coords[i][2];
        }
        element.style.left = coords[i][1] + 'px';
    }
}
