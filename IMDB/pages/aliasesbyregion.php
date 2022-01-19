<?php

    require_once('../db.php');
    $dbcon = createDbConnection();
    if($_GET['region']) {
        $sql = "CALL GetAliasesByRegion('" . $_GET['region']. "')";
    } else {
        $sql = "CALL GetAliasesByRegion('FI')";
    }
    $prepare = $dbcon->prepare($sql);   //valmistellaan
    $prepare->execute();  //kysely tietokantaan
    $rows = $prepare->fetchAll(); //haetaan tulokset (voitaisiin hakea myös eka rivi fetch ja tarkistus)
    $html = '<h1>Top 10 titles';
    if($_GET['region']) {
        $html .= " (" . $_GET['region']. ") ";
    } else {
        $html .= " (FI) ";
    }
    $html .= '</h1>';
    $html .= '<ul>';
    //Käydään rivit läpi 
    foreach($rows as $row){
        $html .= '<li>' . $row["title"] . '</li>';  
    }
    $html .= '</ul>';
    echo $html;