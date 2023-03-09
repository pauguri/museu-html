const root = document.documentElement;

root.addEventListener("mousemove", (e) => {
    root.style.setProperty('--mx', (e.clientX-(window.innerWidth/2)+300) + 'px');
    root.style.setProperty('--my', (e.clientY-(window.innerHeight/2)) + 'px');
})