<?php
    header('Access-Control-Allow-Origin:*');
    header('Content-Type: application/json');
    require_once('../db.php');
    $genre = $_GET['genre'];
    $region = $_GET['region'];
    $dbcon = createDbConnection();
    
    $sql = "SELECT title FROM `aliases` INNER JOIN title_genres ON title_genres.title_id = aliases.title_id WHERE region = '" . $region . "' AND genre LIKE '%" . $genre . "%' LIMIT 10;";
    $prepare = $dbcon->prepare($sql);   //valmistellaan
    $prepare->execute();  //kysely tietokantaan
    $rows = $prepare->fetchAll(); //haetaan tulokset (voitaisiin hakea myös eka rivi fetch header ('HTTP/1.1 200 OK');
    print json_encode($rows);
