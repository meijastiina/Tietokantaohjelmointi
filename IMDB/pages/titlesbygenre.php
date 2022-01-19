<?php

    require_once('../db.php');
    $genre = $_GET['genre'];
    $dbcon = createDbConnection();
    
    $sql = "SELECT primary_title FROM `title_genres` INNER JOIN titles ON title_genres.title_id = titles.title_id WHERE genre LIKE '%" . $genre . "%' LIMIT 10;";
    $prepare = $dbcon->prepare($sql);   //valmistellaan
    $prepare->execute();  //kysely tietokantaan
    $rows = $prepare->fetchAll(); //haetaan tulokset (voitaisiin hakea myös eka rivi fetch ja tarkistus)
    $html = '<h1>' . $genre . '</h1>';
    $html .= '<ul>';
    //Käydään rivit läpi 
    foreach($rows as $row){
        $html .= '<li>' . $row["primary_title"] . '</li>';  
    }
    $html .= '</ul>';
    echo $html;
