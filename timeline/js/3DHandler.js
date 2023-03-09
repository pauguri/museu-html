const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.domElement.id = 'bg-canvas';
renderer.domElement.style.width = "100vw";
renderer.domElement.style.height = "100vh";
document.body.appendChild(renderer.domElement);

scene.background = new THREE.Color(0x070d17); // background color

var stars = [];
for(let x = -100; x <= 100; x+=5){
    const geometry = new THREE.SphereGeometry(0.1,4,4);
    const material = new THREE.MeshBasicMaterial({ color: 0x3BDFF5 }); // star color
    const sphere = new THREE.Mesh(geometry, material);
    sphere.position.x = x;
    sphere.position.y = (Math.random()*40) - 20;
    sphere.position.z = (Math.random()*20) - 10;
    scene.add(sphere);
    stars.push(sphere);
}

camera.position.z = 20;

function shiftBGHorizontal(offset) {
    stars.forEach(star => {
        star.position.x += offset/100;
        if(star.position.x < -100){
            star.position.x = 100;
        } else if(star.position.x > 100){
            star.position.x = -100;
        }
    })
}

var targetY = 0;
function shiftBGVertical(position) {
    targetY = position;
}

function setStarColor(color){
    stars.forEach(star => {
        star.material.color.setHex(color);
    })
    scene.background = color == "0xF5DD23" ? new THREE.Color(0x121205) : color == "0x3BDFF5" ? new THREE.Color(0x070d17) : new THREE.Color(0x170713);
}

function animate() {
    requestAnimationFrame(animate);

    if(camera.position.y != targetY){
        camera.position.y = lerp(camera.position.y, targetY, 0.25);
        // camera.position.y += camera.position.y < targetY ? 0.5 : -0.5;
    }

    renderer.render(scene,camera);
}
animate();

function lerp(v0, v1, t) {
    return v0*(1-t)+v1*t
}