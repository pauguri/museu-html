<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/16854bd097.js" crossorigin="anonymous"></script>
    <script src="./js/jquery-3.6.3.min.js"></script>
    <title>Eurovision Scoreboard</title>
</head>
<body>
    <?php
        require_once("conexion_pdo.php");
        require_once("checksession.php");
        include("header.php");
        $db = new Conexion();
    ?>

    <main>
        <?php
            // CHECK IF ROOM EXISTS

            $code = strtolower($_GET["code"]);

            $result = $db->prepare("SELECT COUNT(*) FROM ev_rooms WHERE id='$code'");
            $result->execute();

            if($result->fetchColumn() == 0){
                header("location:userhome.php?e=1");
                return;
            }

            // CHECK IF USER JOINED ROOM BEFORE

            $result = $db->prepare("SELECT COUNT(*) FROM ev_joined_rooms WHERE room='$code' AND user='$_COOKIE[ev_userid]'");
            $result->execute();

            if($result->fetchColumn() == 0){
                header("location:joinconfirmation.php?code=$code");
                return;
            }

            // OK ALL GOOD, START BY QUERYING ROOM INFO

            $pointValues = array(1,2,3,4,5,6,7,8,10,12);

            $result = $db -> prepare("SELECT year,city,country,ev_users.name AS owner, ev_rooms.id AS code FROM ev_rooms,ev_contests,ev_users WHERE ev_rooms.id='$_GET[code]' AND ev_rooms.owner=ev_users.id AND ev_rooms.contest=ev_contests.year");
            $result -> execute();
            $roomInfo = $result -> fetch();

            echo "You are: $_SESSION[name]<br>
                Room with code: " . strtoupper($code) . "<br>
                Created by: $roomInfo[owner]<br>
                Of contest: $roomInfo[city] $roomInfo[year] ($roomInfo[country])";


            // QUERY SONG LIST

            $result = $db -> prepare("SELECT title,artist,link,country,contest,ev_countries.name AS countryName FROM ev_songs,ev_countries WHERE contest='$roomInfo[year]' AND ev_songs.country=ev_countries.id ORDER BY ev_countries.name");
            $result -> execute();

            echo "<div id='song-list'>";
            foreach ($result as $song) {

                // QUERY USER'S POINTS AWARDED TO SONG

                $votesQuery = $db -> prepare("SELECT points FROM ev_votes WHERE room='$_GET[code]' AND user='$_COOKIE[ev_userid]' AND country='$song[country]'");
                $votesQuery -> execute();

                $voteCount = count($votesQuery -> fetchAll());

                if($voteCount == 1){
                    $votesQuery -> execute();
                    $points = $votesQuery -> fetchColumn();
                    $selectedIndex = array_search($points,$pointValues);
                    echo "<div class='song selected'>";
                } else {
                    $points = "";
                    $selectedIndex = -1;
                    echo "<div class='song'>";
                }

                    echo "<div class='song-details' data-before='$points' style='background-image: url(img/songs/$song[country]_$song[contest].jpg)'>
                        <div class='song-text'>
                            <div class='song-title'>$song[title]</div>
                            <div class='song-artist'>$song[artist]</div>
                        </div>
                        <div class='song-flag'>
                            <img src='img/countries/$song[country].svg'>
                        </div>
                    </div>
                    <div class='song-form'>
                        <div class='points-btn-holder'>";
                
                for($i = 0; $i < count($pointValues); $i++){
                    if($selectedIndex == $i){
                        echo "<button class='points-btn selected' data-value='$pointValues[$i]' data-room='$code' data-user='$_COOKIE[ev_userid]' data-country='$song[country]'>$pointValues[$i]</button>";
                    } else {
                        echo "<button class='points-btn' data-value='$pointValues[$i]' data-room='$code' data-user='$_COOKIE[ev_userid]' data-country='$song[country]'>$pointValues[$i]</button>";
                    }
                }
                echo "</div></div></div>";
            }
            echo "</div>";

            $db = null;
        ?>
    </main>

    <script>
        $(function() {
            $(".song-details").click(function() {
                $(".song-form").slideUp("fast");
                let form = $(this).next(".song-form");
                if(form.css("display") == "none"){
                    form.slideDown("fast");
                }
            });

            $(".points-btn").click(function(e) {
                let room = $(this).data("room");
                let user = $(this).data("user");
                let country = $(this).data("country");
                let points = $(this).data("value");
                $.ajax({
                    type: "POST",
                    url: "submitvote.php",
                    data: {room: room, user: user, country: country, points: points},
                    dataType: "JSON",
                    success: function(response){
                        if(response.isSuccess == 1){
                            $(e.target).siblings(".points-btn").removeClass("selected");
                            $(e.target).addClass("selected");
                            $(e.target).parents(".song").addClass("selected");
                            $(e.target).parents(".song").children(".song-details").attr("data-before",points);
                        }
                }});
            })
        })
    </script>
</body>
</html>