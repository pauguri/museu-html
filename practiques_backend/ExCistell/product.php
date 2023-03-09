<?php include("header.php"); ?>

    <nav>
        <div class="flavor-menu">
            <?php
                require_once("conexion_pdo.php");
                $db = new Conexion();

                $currentID = $_GET["id"];
                $result = $db -> query("SELECT id,nom FROM s14productes");
                foreach ($result as $key => $product) {
                    if($key != 0){
                        echo "<div class='spacer'>/</div>";
                    }

                    echo "<div class='fm-item" . 
                        (($product["id"] == $currentID) ? " fm-selected'>$product[nom]" : "'><a href='product.php?id=$product[id]'>$product[nom]</a>") .
                    "</div>";
                }

                $db = null;
            ?>
        </div>
    </nav>
    
    <main>
        <?php
            require_once("conexion_pdo.php");
            $db = new Conexion();

            $result = $db -> prepare("SELECT * FROM s14productes WHERE id=$_GET[id]");
            $result -> execute();
            $product = $result -> fetch();

            echo "<div class='m-wrapper'>
            <div class='m-img' style='background-image: url($product[imatge]);'></div>
                <div class='m-info'>
                    <p id='desc'>$product[descripcio]</p>
                    <span class='price-text'>$product[preu]€</span>
                    <form class='addtocart' action='cart.php' method='POST'>
                        <input type='hidden' name='id' value='$product[id]'>
                        <input type='hidden' name='pack' value='1'>
                        <input name='cont' class='cont' type='number' min='1' max='10' value='1'>
                        <button class='btn addtocart-btn' type='submit'><ion-icon class='btn-cart' name='cart'></ion-icon> add to cart</button>
                    </form>
                </div>
            </div>
            <h2 id='p-title'>Multiple can packs</h2>
            <div class='packs-wrapper'>";

            $result = $db -> prepare("SELECT * FROM s14prodspacks WHERE productes=$product[id]");
            $result -> execute();

            foreach ($result as $pack) {
                echo "<div class='pack-box'>
                    <div class='p-img'></div>
                    <div class='p-info'>$pack[quantitat] cans of <strong>$product[nom]</strong> JOULE</div>
                    <div class='price-text'>$pack[preu]€</div>
                    <form class='addtocart' action='cart.php' method='POST'>
                        <input type='hidden' name='id' value='$product[id]'>
                        <input type='hidden' name='pack' value='$pack[quantitat]'>
                        <input class='cont' type='number' min='1' max='10' value='1'>
                        <button class='btn addtocart-btn' type='submit'><ion-icon class='btn-cart' name='cart'></ion-icon> add to cart</button>
                    </form>
                </div>";
            }

            echo "</div>";

            $db = null;
        ?>
    </main>

    <!-- iconos -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>