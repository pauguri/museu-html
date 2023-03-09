const timelineDiv = document.getElementById("timeline");
const scrollbar = document.getElementById("scrollbar");
const categoryArrows = document.querySelectorAll(".category-btn ion-icon");
const scrollNotice = document.getElementById("scrollbar-notice");
const modalCover = document.getElementById("cover");
const root = document.documentElement;
var years = {};
var data = [];
var modalOpen = false;
var scrollNoticeShown = true;
const months = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];

// SCROLL STUFF
window.addEventListener("wheel", (evt) => {
    if(modalOpen) { return; }
    evt.preventDefault();
    timelineDiv.scrollBy({
        left: evt.deltaY < 0 ? -100 : 100,
        behaviour: 'smooth'
    });
    scrollbar.style.left = map(timelineDiv.scrollLeft, [0, timelineDiv.scrollWidth - window.innerWidth], [0, scrollbar.parentNode.offsetWidth - scrollbar.offsetWidth]) + "px";
}, {passive: false});
var clickedOnScrollbar = false;
var scrollbarOfsset;
scrollbar.addEventListener("mousedown", (evt) => {
    if(evt.button != 0){ return; }
    evt.preventDefault();
    scrollbarOfsset = evt.clientX - scrollbar.style.left.replace("px","");
    clickedOnScrollbar = true;
})
window.addEventListener("mousemove", (evt) => {
    if(!clickedOnScrollbar){ return; }
    let scrollbarPosition = clamp(evt.clientX - scrollbarOfsset, 0, scrollbar.parentNode.offsetWidth - scrollbar.offsetWidth);
    scrollbar.style.left = scrollbarPosition + "px";
    timelineDiv.scroll(map(scrollbarPosition,[0, scrollbar.parentNode.offsetWidth - scrollbar.offsetWidth], [0, timelineDiv.scrollWidth - window.innerWidth]),0);
})
window.addEventListener("mouseup", (evt) => {
    if(evt.button != 0 || !clickedOnScrollbar){ return; }
    clickedOnScrollbar = false;
})

var lastScrollPos = 0;
timelineDiv.addEventListener("scroll", () => {
    if(scrollNoticeShown){
        scrollNoticeShown = false;
        scrollNotice.style.opacity = 0;
        setTimeout(() => {
            scrollNotice.remove();
        }, 500);
    }
    let offset = lastScrollPos - timelineDiv.scrollLeft;
    lastScrollPos = timelineDiv.scrollLeft;
    shiftBGHorizontal(offset);
})

// ON LOAD
function loadTimeline(){
    fetch("./items.json")
        .then(response => response.json())
        .then(jsonData => {
            data = jsonData;
            // sort events into years
            data.forEach(eventData => {
                let year = eventData.date.split('.')[0];
                if(!(year in years)){
                    years[year] = {
                        tech: [],
                        history: [],
                        art: []
                    };
                }
                years[year][eventData.category].push(eventData);
            });

            // sort each year's events by date
            for(let y in years){
                for(let c in years[y]){
                    years[y][c].sort((a,b) => {
                        let d1 = a.date.split('.');
                        let d2 = b.date.split('.');
                        return d1[1] - d2[1] == 0 ? d1[2] - d2[2] : d1[1] - d2[1];
                    })
                }
            }

            // create HTML elements for each year
            for(let y in years){ createYear(years[y], y) }

            document.getElementById("loading-screen").style.opacity = 0;
            setTimeout(() => {
                document.getElementById("loading-screen").remove();
            }, 500);
        })
}

function createYear(yearObj, yearNum) {
    let yearDiv = document.createElement("div");
    yearDiv.className = "year";
        yearDiv.innerHTML += `<div class="year-num">${yearNum}</div>`
        for(let c in yearObj){
            let eventContainer = document.createElement("div");
            eventContainer.className = "event-container " + c;
            if(yearObj[c].length > 0){
                yearObj[c].forEach(eventObj => {
                    let month = eventObj.date.split(".")[1];
                    let day = parseInt(eventObj.date.split(".")[2]);
                    eventContainer.innerHTML += `<div class="event" onclick="openModal('${eventObj.id}')">
                        <div class="event-img" style="background-image: url(./img/${eventObj.id}.${eventObj.imageExtension})">
                            <div class="event-details">
                                <div class="event-title">${eventObj.title}</div>
                                <div class="event-date">${(day == 0 ? "" : (day + " de ")) + (month == 0 ? eventObj.date.split(".")[0] : months[month-1])}</div>
                            </div>    
                        </div>
                    </div>`
                })
            }
            yearDiv.appendChild(eventContainer);
        }
    timeline.appendChild(yearDiv);
}

function centerCategory(c){
    let offset, color;
    root.style.setProperty('--tech-opacity',"0.3");
    root.style.setProperty('--history-opacity',"0.3");
    root.style.setProperty('--art-opacity',"0.3");
    switch(c){
        case 'T':
            offset = "250px";
            color = "#3BDFF5";
            shiftBGVertical(5);
            root.style.setProperty('--tech-opacity',"1");
            categoryArrows[0].style.opacity = "0";
            categoryArrows[1].name = "chevron-down-circle-outline";
            categoryArrows[1].style.opacity = categoryArrows[2].style.opacity = "1";
            break;
        case 'H':
        default:
            offset = "500px";
            color = "#F5DD23";
            shiftBGVertical(0);
            root.style.setProperty('--history-opacity',"1");
            categoryArrows[1].style.opacity = "0";
            categoryArrows[0].style.opacity = categoryArrows[2].style.opacity = "1";
            break;
        case 'A':
            offset = "750px";
            color = "#F50A82";
            shiftBGVertical(-5);
            root.style.setProperty('--art-opacity',"1");
            categoryArrows[2].style.opacity = "0";
            categoryArrows[1].name = "chevron-up-circle-outline";
            categoryArrows[0].style.opacity = categoryArrows[1].style.opacity = "1";
            break;
    }
    root.style.setProperty("--offset",offset);
    root.style.setProperty("--accent-color",color);
    setStarColor(color.replace("#","0x"));
}

function openModal(id){
    if(modalOpen) { return; }
    modalOpen = true;

    let eventData = data.find(element => element.id == id);

    let dateArr = eventData.date.split(".");

    timelineDiv.innerHTML += `
        <div class="modal">
            <div id="cover"></div>
            <div class="modal-content">
                <h1>${eventData.title}</h1>
                <h2>${(dateArr[2] == 0 ? "" : (dateArr[2] + " de ")) + (dateArr[1] == 0 ? dateArr[0] : (months[dateArr[1]-1] + " de " + dateArr[0]))}</h2>
                <p>${eventData.desc}</p>
                <img src="./img/${eventData.id}.${eventData.imageExtension}" alt="${eventData.title}">
            </div>
            <div class="close-modal" onclick="closeModal(this.parentNode)"><ion-icon name="close-outline"></ion-icon></div>
        </div>`
}

function closeModal(element){
    
    element.style.opacity = 0;
    setTimeout(() => {
        element.remove();
    }, 500);
    modalOpen = false;
}

// utils
const clamp = (num, min, max) => Math.min(Math.max(num, min), max);
const map = (value, oldRange, newRange) => {
    var newValue = (value - oldRange[0]) * (newRange[1] - newRange[0]) / (oldRange[1] - oldRange[0]) + newRange[0];
    return Math.min(Math.max(newValue, newRange[0]) , newRange[1]);
};