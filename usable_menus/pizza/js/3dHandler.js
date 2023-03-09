// import { OrbitControls } from './OrbitControls.js';
import { GLTFLoader } from './GLTFLoader.js';
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(70, 16/9, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(1000,1000);
renderer.domElement.style.width = "100%";
renderer.domElement.style.height = "100%";
document.getElementById("canvas-holder").appendChild(renderer.domElement);

scene.background = new THREE.Color(0x733e06);
const light = new THREE.AmbientLight(0xffffff, 2); // soft white light
scene.add( light );

const loader = new GLTFLoader();
var model;
loader.load(
    'https://citmalumnes.upc.es/~paugv2/usable_menus/pizza/assets/PIZZA_5K.gltf',
    (object) => {
        model = object.scene;
        scene.add(object.scene);
        document.getElementById('loading-model').remove();
    },
    (xhr) => {
        var percent = Math.round(xhr.loaded / xhr.total * 100);
        document.getElementById('loading-model').innerHTML = percent + "%";
    },
    (error) => {
        console.log(error);
    }
);

// const controls = new OrbitControls(camera, renderer.domElement);
// controls.enableDamping = true;
// controls.addEventListener( "change", event => {  
//     console.log( controls.object.position ); 
//     console.log( controls.object.rotation );
// });
// controls.update();

camera.position.x = -0.15;
camera.position.y = 0.13;
camera.position.z = 0.1;
camera.rotation.x = -1.55;
camera.rotation.y = -0.55;
camera.rotation.z = -1.53;

function animate() {
    window.requestAnimationFrame(animate);
    // controls.update();
    if(model != null){
        model.rotation.y += 0.01;
    }
    renderer.render(scene, camera);
}
animate();