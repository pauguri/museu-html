const root = document.documentElement;
const container = document.querySelector('.container');
const welcome = document.querySelector('.welcome');
const time = document.querySelector('.time');

const date1 = new Date;
const hour = date1.getHours();

if(hour<5 || hour>=23){
    welcome.innerHTML = "Bona nit.";
} else if(hour>=13 && hour<20){
    welcome.innerHTML = "Bona tarda.";
} else if(hour>=20 && hour<23){
    welcome.innerHTML = "Bon vespre.";
} else {
    welcome.innerHTML = "Bon dia.";
}

setInterval(() => {
    var date2 = new Date();
    time.innerHTML = date2.toLocaleTimeString();
}, 1000);



container.addEventListener("scroll", () => {
    var scrollpercent = (document.body.scrollTop + container.scrollTop) / (container.scrollHeight - document.documentElement.clientHeight);
    
    var hue = scrollpercent*360;
    console.log(`Scroll: ${scrollpercent}, Hue: ${hue}`)
    root.style.setProperty('--hue',`hsl(${hue},50%,75%)`);

    welcome.style.opacity = 1-scrollpercent*4;
    welcome.style.transform = `translate(-50%,-${scrollpercent*100 + 'px'})`;

    time.style.opacity = -3+scrollpercent*4;
    time.style.transform = `translate(-50%,-${scrollpercent*100 + 'px'})`;
});