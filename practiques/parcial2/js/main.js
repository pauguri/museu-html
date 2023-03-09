const menu = document.getElementById('menu');
const mList = document.getElementById('menu-list');

function toggleMenu(){
    menu.classList.toggle('open');
    mList.classList.toggle('expanded');
}