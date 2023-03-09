const glyphs = 'ABCDEFGHIJKLMNOPQRSTUVWXYabcdefghijklmnopqrstuvwxy';

function joinMaster(){
    document.querySelector('.main-menu').style.display = 'none';
    document.querySelector('.cluemaster-game').style.display = 'block';
    var index = Math.floor(Math.random()*glyphs.length);
    document.querySelector('.glyph').innerHTML = glyphs[index];
    document.getElementById('answer').innerHTML = index;
}

function joinGuesser(){
    document.querySelector('.main-menu').style.display = 'none';
    document.querySelector('.guesser-game').style.display = 'block';

    const wrapper = document.querySelector('.glyphs-wrapper');
    for(let i=0; i<glyphs.length; i++){
        let div = document.createElement('div');
        div.innerHTML = glyphs[i];
        div.classList.add('glyph-btn');
        div.setAttribute('onclick','clickGlyph(this)');
        wrapper.appendChild(div);
    }
}

function clickGlyph(glyph){
    alert('Tell your cluemaster the number: ' + glyphs.indexOf(glyph.innerHTML));
}