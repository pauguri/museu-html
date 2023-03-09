// import { OrbitControls } from './OrbitControls.js';
import { FBXLoader } from './FBXLoader.js';
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(30, 16/9, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(1000,1000);
renderer.domElement.style.width = "100%";
renderer.domElement.style.height = "100%";
document.getElementById("canvas-holder").appendChild(renderer.domElement);

scene.background = new THREE.Color(0x733e06);
const alight = new THREE.AmbientLight(0xffffff, 0.3); // soft white light
scene.add( alight );
const plight = new THREE.PointLight( 0xffefc2, 1, 500 );
plight.position.set( -100, 100, 100 );
scene.add( plight );

const loader = new FBXLoader();
var model;
loader.load(
    'https://citmalumnes.upc.es/~paugv2/usable_menus/assets/PASTA2.fbx',
    (object) => {
        model = object;
        scene.add(object);
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

camera.position.x = -117.58;
camera.position.y = 88.23;
camera.position.z = -23.87;
camera.rotation.x = -2.09;
camera.rotation.y = -0.83;
camera.rotation.z = -2.23;
// controls.update();

function animate() {
    window.requestAnimationFrame(animate);
    // controls.update();
    if(model != null){
        model.rotation.y += 0.01;
    }
    renderer.render(scene, camera);
}
animate();