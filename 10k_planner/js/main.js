var data, graph, lineNames;
function loadData(){
    fetch(window.location + '/js/data.json')
        .then(response => response.json())
        .then(JsonData => {
            data = JsonData.data;
            graph = JsonData.graph;
            lineNames = JsonData.terminalsToLine;
            console.log('Done Loading JSON');
            document.querySelector('button').disabled = '';
            document.querySelector('button').innerHTML = 'Show me the way';
        })
}

const tripContainer = document.querySelector('.trip-container');
var from, to, fromLine, toLine, shortestPath;

function getTrip() {
    tripContainer.innerHTML = '';
    from = document.getElementById('fromn').value;
    fromLine = floorToLine(from);
    to = document.getElementById('ton').value;
    toLine = floorToLine(to);
    if(from == to){
        return false;
    }

    var workingGraph = JSON.parse(JSON.stringify(graph));
    workingGraph[from] = {};
    workingGraph[to] = {};

    let fromLineData = data.L[fromLine];
    let toLineData = data.L[toLine];
    let fromInput, toInput;
    if((from - fromLineData.from) == 0){
        fromInput = fromLineData.terminals[0];
    } else if((fromLineData.to - from) == 0){
        fromInput = fromLineData.terminals[1];
    } else {
        workingGraph[from][fromLineData.terminals[0]] = (from - fromLineData.from)*0.2;
        workingGraph[from][fromLineData.terminals[1]] = (fromLineData.to - from)*0.2;
        fromInput = from;
    }
    if((to - toLineData.from) == 0){
        toInput = toLineData.terminals[0];
    } else if((toLineData.to - to) == 0){
        toInput = toLineData.terminals[1];
    } else {
        workingGraph[toLineData.terminals[0]][to] = (to - toLineData.from)*0.2;
        workingGraph[toLineData.terminals[1]][to] = (toLineData.to - to)*0.2;
        toInput = to;
    }
    if(fromLine == toLine){
        workingGraph[from][to] = Math.abs(from - to)*0.2;
        fromInput = from;
        toInput = to;
    }
    console.log(workingGraph);
    shortestPath = findShortestPath(workingGraph,fromInput,toInput);
    console.log(shortestPath);
    parseTrip(shortestPath);
}

function parseTrip(pathObj){
    // SHOW TOTAL TIME
    let tripTimeDiv = document.createElement('div');
    tripTimeDiv.className = 'trip-time';
    tripTimeDiv.innerHTML = timeFromSeconds(pathObj.distance);
    tripContainer.appendChild(tripTimeDiv);

    // PARSE TRIP PATH
    var parsedTrip = [];

    if(pathObj.path.length <= 2){
        parsedTrip.push({
            line: pathObj.path[0].includes('T') && pathObj.path[1].includes('T') ? lineNames[pathObj.path[0]][pathObj.path[1]][0] : 'L' + toLine,
            direction: Number(from) > Number(to) ? 'down' : 'up',
            start: from,
            end: to,
            stopCount: Math.abs(toFloorIfTerminal(from) - toFloorIfTerminal(to))
        });
    } else {
        let previousLineType = null, currentIndex;
        for(let i = 0; i < pathObj.path.length - 1; i++){

            if(pathObj.path[i].includes('T') && pathObj.path[i + 1].includes('T')){
                let line = lineNames[pathObj.path[i]][pathObj.path[i+1]][0];
                let direction = lineNames[pathObj.path[i]][pathObj.path[i+1]][1];
                if(line.substr(0,1) == 'L'){
                    parsedTrip.push({
                        line: line,
                        direction: direction,
                        start: pathObj.path[i],
                        end: pathObj.path[i + 1],
                        stopCount: Math.abs(toFloorIfTerminal(pathObj.path[i]) - toFloorIfTerminal(pathObj.path[i + 1]))
                    });
                } else {
                    if(previousLineType === null || previousLineType != line.substr(0,1)){
                        previousLineType = line.substr(0,1);
                        parsedTrip.push({
                            line: previousLineType + '1',
                            direction: direction,
                            start: pathObj.path[i],
                            end: pathObj.path[i + 1],
                            stopCount: 1
                        });
                        currentIndex = parsedTrip.length - 1;
                    } else {
                        parsedTrip[currentIndex].stopCount++;
                        parsedTrip[currentIndex].end = pathObj.path[i + 1];
                    }
                }
            } else {
                let is1Terminal = pathObj.path[i].includes('T');
                let is2Terminal = pathObj.path[i + 1].includes('T');
                parsedTrip.push({
                    line: 'L' + (is1Terminal || (!is1Terminal && !is2Terminal) ? toLine : fromLine),
                    direction: Number(toFloorIfTerminal(pathObj.path[i])) > Number(toFloorIfTerminal(pathObj.path[i + 1])) ? 'down' : 'up',
                    start: pathObj.path[i],
                    end: pathObj.path[i + 1],
                    stopCount: Math.abs(toFloorIfTerminal(pathObj.path[i]) - toFloorIfTerminal(pathObj.path[i + 1]))
                });
            }
        }
    }

    parsedTrip.forEach((entry) => {
        createTripNode(entry.line, entry.direction, entry.start, entry.end, entry.stopCount);
    })

    let allDestinations = document.querySelectorAll('.trip-node-destination');
    let lastDestination = allDestinations[allDestinations.length - 1]
    lastDestination.classList.add('final-destination');
    let innerDiv = lastDestination.querySelector('div');
    innerDiv.innerHTML = toFloorIfTerminal(innerDiv.innerHTML);
    tripContainer.style.display = "";
}

function createTripNode(line, direction, fromNum, toNum, stopCount){
    console.log(line + ' ' + direction + ' from ' + fromNum + ' to ' + toNum);
    let lineType = line.toString().substr(0,1);
    let lineNum = line.toString().substr(1,1);
    fromNum = fromNum.toString();
    toNum = toNum.toString();
    let lineColor = data[lineType][lineNum]['color'];

    let mainLineDiv = document.createElement('div');
    mainLineDiv.className = 'trip-node-line';
    mainLineDiv.style.setProperty('--line-color', lineColor);
        let iconDiv = document.createElement('div');
        iconDiv.className = `${lineType}-icon`;
        iconDiv.style.setProperty('--line-color', lineColor);
        mainLineDiv.appendChild(iconDiv);

        let lineDiv = document.createElement('div');
            let lineSpan = document.createElement('span');
            lineSpan.style.color = lineColor;
            lineSpan.innerHTML = line.replace('X','SS') + (direction == 'up' ? ' <i class="fas fa-arrow-up"></i>' : ' <i class="fas fa-arrow-down"></i>');
            lineDiv.appendChild(lineSpan);
            lineDiv.appendChild(document.createElement('br'));
            lineDiv.append(document.createTextNode(stopCount + (stopCount == 1 ? ' stop' : ' stops')));
            lineDiv.appendChild(document.createElement('br'));

            let timeCount = line.includes('L') ? stopCount*0.2 : line.includes('S') ? stopCount*375 : stopCount*600;

            lineDiv.append(document.createTextNode(timeFromSeconds(timeCount)));
        mainLineDiv.appendChild(lineDiv);
    tripContainer.appendChild(mainLineDiv);
    let mainDestDiv = document.createElement('div');
    mainDestDiv.className = 'trip-node-destination';
        let destDiv = document.createElement('div');
        destDiv.innerHTML = toNum;
        mainDestDiv.appendChild(destDiv);
        if(toNum.includes('T')){
            let connections = data.T[toNum.substr(1,1)]['connections'];
            let connectionsDiv = document.createElement('div');
            connections.forEach(c => {
                let span = document.createElement('span');
                span.style.color = data[c.substr(0,1)][c.substr(1,1)]['color'];
                span.innerHTML = c.replace('X','SS') + ' ';
                connectionsDiv.appendChild(span);
            });
            mainDestDiv.appendChild(connectionsDiv);
        }
    tripContainer.appendChild(mainDestDiv);
}

// PATHFINDING (Dijkstra Algorithm)

function findShortestPath(graph, startNode, endNode){
    let distances = {};
    distances[endNode] = "Infinity";
    distances = Object.assign(distances, graph[startNode]);

    let parents = { endNode: null };
    for(let child in graph[startNode]) {
        parents[child] = startNode;
    }

    let visitedNodes = [];

    let node = shortestDistanceNode(distances, visitedNodes);

    while(node) {
        let distance = distances[node];
        let children = graph[node];
        for(let child in children) {
            if(String(child) === String(startNode)) {
                continue;
            } else {
                let newDistance = distance + children[child];
                if(!distances[child] || distances[child] > newDistance) {
                    distances[child] = newDistance;
                    parents[child] = node;
                }
            }
        }
        
        visitedNodes.push(node);
        node = shortestDistanceNode(distances,visitedNodes);
    }

    let shortestPath = [endNode];
    let parent = parents[endNode];
    while(parent) {
        shortestPath.push(parent);
        parent = parents[parent];
    }
    shortestPath.reverse();

    return { path: shortestPath, distance: distances[endNode] };
}

let shortestDistanceNode = (distances,visited) => {
    let shortest = null;
    for (let node in distances) {
        let isCurrentShortest = shortest === null || distances[node] < distances[shortest];
        if(isCurrentShortest && !visited.includes(node)) {
            shortest = node;
        }
    }
    return shortest;
}

// UTILS

let floorToLine = (stage) => {
    return stage == 0 ? 1 : Math.ceil((stage/10000)*8);
}

let toFloorIfTerminal = (n) => {
    return n.includes('T') ? data.T[n.substr(1,1)].floor : n;
}

let timeFromSeconds = (seconds) => {
    let min = Math.floor(seconds/60);
    let sec = Math.floor(seconds%60);
    sec = sec < 10 ? '0' + sec : sec;

    return `${min}${sec == '00' ? '' : ':' + sec} min`;
}