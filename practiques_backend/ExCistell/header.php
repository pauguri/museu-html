<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOULE - Energy from nature</title>
    <link rel="icon" type="image/x-icon" href="./assets/LogoJoule.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./style/style.css">
</head>
<body>
<header>
    <div class="h-wrapper">
        <a href="index.php">
            <div class="logo">
                <svg version="1.1" id="svg-logo" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" x="0px" y="0px" viewBox="0 0 56.78 51.26">
                    <polygon class="st0" points="23.5,11.8 28.23,51.28 11.31,51.3 0,31.16 18.09,37.65 13.58,0 "/>
                    <polygon class="st0" points="26.63,15.14 30.96,51.26 56.78,51.26 38.69,44.77 36.59,27.24 "/>
                </svg>
                <span id="text-logo">JOULE</span>
            </div>
        </a>
        <div id="cart-wrapper">
            <div id="h-cart" onclick="toggleCart()">
                <ion-icon id="h-cart-icon" name="cart"></ion-icon>
                <div id="cart-num">0</div>
            </div>
            <div class="cart-module hidden">
                <div id="cart-list">
                    <div id="cart-items-holder"></div>
                    <span id="empty-cart" onclick="emptyCart()"><ion-icon name="trash"></ion-icon> Empty cart</span>
                </div>
                <div id="cart-total">
                    <span class="cart-list-text">Total:</span>
                    <div class="cart-total"></div>
                </div>
                <button class="btn" id="checkout-btn" onclick="checkout()">Checkout</button>
            </div>
        </div>
        
    </div>
</header>
<h1 class="slogan">Energy from nature.</h1>