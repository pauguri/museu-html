const cartNum = document.getElementById('cart-num');
const cartList = document.getElementById('cart-items-holder');
const cartModule = document.querySelector('.cart-module');
const cartTotal = document.querySelector('.cart-total');
var total = 0;

function init(){
    let cartAmount = window.localStorage.getItem('cart-amount');
    let cartItems = window.localStorage.getItem('cart-items');
    if(cartAmount == null || isNaN(cartAmount)){
        window.localStorage.setItem('cart-amount',0);
    }
    if(cartItems != null){
        let parsedItems = cartItems.split('&');
        parsedItems.forEach(item => {
            if(item.length > 0){
                createCartItem(item);
            }
        });
    } else {
        window.localStorage.setItem('cart-items','');
    }
    updateCartNum();
    
}

function addToCart(form){
    var fields = form.elements;
    var formDataString = `${fields[1].value}-${fields[0].value}`;
    console.log(formDataString);
    let cartItems = window.localStorage.getItem('cart-items');
    window.localStorage.setItem('cart-items', cartItems + formDataString + '&');
    createCartItem(formDataString);

    let cartAmount = window.localStorage.getItem('cart-amount');
    window.localStorage.setItem('cart-amount',parseInt(cartAmount)+parseInt(fields[1].value));
    updateCartNum();
}

function createCartItem(data) { // format de dades: {quantitat}-{sabor(o,a,b)}{tipus(1,2,3)}{preu}
    var splitData = data.split('-');
    var amount = splitData[0];
    var flavor = splitData[1].charAt(0);
    var type = splitData[1].charAt(1);
    var price = splitData[1].substring(2);

    var itemName = '';
    switch(flavor){
        case 'o':
            itemName = 'Blood Orange JOULE';
            break;
        case 'a':
            itemName = 'Apple JOULE';
            break;
        case 'b':
            itemName = 'Banana JOULE';
    }
    switch(type){
        case '1':
            itemName += ' (single can)';
            break;
        case '2':
            itemName += ' (6 pack)';
            break;
        case '3':
            itemName += ' (12 pack)';
    }
    var itemPrice = price.replace('.',',') + '€';

    let listItem = document.createElement('div');
    listItem.innerHTML = `<div class="cart-list-text"><span class="cart-list-amount">${amount}x</span>${itemName}</div><div class="cart-list-price">${itemPrice}</div>`;
    listItem.setAttribute('onclick','deleteCartItem(this)');
    listItem.classList.add('cart-list-item');
    cartList.appendChild(listItem);

    total += parseFloat(price)*parseFloat(amount);
    cartTotal.innerHTML = total.toFixed(2).toString().replace('.',',') + '€';
}

function updateCartNum(){
    let cartAmount = window.localStorage.getItem('cart-amount');

    if(cartAmount > 0){
        if(cartNum.style.display = 'none'){
            cartNum.style.display = 'block';
        }
        cartNum.innerHTML = cartAmount;
    } else {
        cartNum.style.display = 'none';
    }
}

function deleteCartItem(item){
    let parsedItems = window.localStorage.getItem('cart-items').split('&');
    var index = Array.prototype.indexOf.call(item.parentNode.children, item);
    let amount = parsedItems[index].split('-')[0];
    let price = parsedItems[index].split('-')[1].substring(2);
    console.log(amount);
    parsedItems.splice(index,1);
    window.localStorage.setItem('cart-items',parsedItems.join('&'));

    let cartAmount = window.localStorage.getItem('cart-amount');
    window.localStorage.setItem('cart-amount', parseInt(cartAmount) - parseInt(amount));
    updateCartNum();
    if(cartAmount == 1){
        cartModule.classList.add('hidden');
    }

    total -= price*amount;
    cartTotal.innerHTML = total.toFixed(2).toString().replace('.',',') + '€';

    item.remove();
}

function emptyCart(){
    cartList.innerHTML = '';
    window.localStorage.setItem('cart-items','');
    window.localStorage.setItem('cart-amount',0);
    updateCartNum();
    total = 0;
    cartTotal.innerHTML = total.toFixed(2).toString().replace('.',',') + '€';
    cartModule.classList.add('hidden');
}

function toggleCart(){
    let cartAmount = window.localStorage.getItem('cart-amount');
    if(cartAmount>0){
        cartModule.classList.toggle('hidden');
    }
}

function checkout(){
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition((position) => {
            window.open(`https://maps.google.com/?q=${position.coords.latitude},${position.coords.longitude}`);
        });
    } else {
        alert("The order cannot be fulfilled because location access is not available");
    }
}