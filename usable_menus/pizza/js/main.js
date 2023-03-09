const root = document.documentElement;
const header = document.querySelector('.header');
var expanded = true;
window.addEventListener("scroll", () => {
    var scrollpercent = (document.body.scrollTop + document.documentElement.scrollTop) / (document.documentElement.scrollHeight - document.documentElement.clientHeight);
    if(scrollpercent > 0 && expanded){
        expanded = false;
        root.style.setProperty('--hh','50px');
        header.classList.add('collapsed');
        setTimeout(() => {
            header.classList.remove('collapsed');
        }, 500);
    } else if(scrollpercent <= 0) {
        expanded = true;
        root.style.setProperty('--hh','150px');
        header.classList.add('expanded');
        setTimeout(() => {
            header.classList.remove('expanded');
        }, 500);
    }
});