
<?php
    function getRegionsDropDown() {
        require_once('db.php');
        $dbcon = createDbConnection();
        $sql = "SELECT DISTINCT region FROM `aliases`";
        $prepare = $dbcon->prepare($sql);   //valmistellaan
        $prepare->execute();  //kysely tietokantaan
        $rows = $prepare->fetchAll(); //haetaan tulokset (voitaisiin hakea myös eka rivi fetch ja tarkistus)
        $html = '<div><label for="region">Region: </label>';
        $html .= '<select name="region">';
        //Käydään rivit läpi 
        foreach($rows as $row){
            $html .= '<option>' . $row["region"] . '</option>';  
        }
        
        $html .= '</select></div>';
        return $html;
    }
    function getGenresDropDown() {
        require_once('db.php');
        $dbcon = createDbConnection();
        $sql = "SELECT DISTINCT genre FROM `title_genres`";
        $prepare = $dbcon->prepare($sql);   //valmistellaan
        $prepare->execute();  //kysely tietokantaan
        $rows = $prepare->fetchAll(); //haetaan tulokset (voitaisiin hakea myös eka rivi fetch ja tarkistus)
        $html = '<div><label for="genre">Genre: </label>';
        $html .= '<select name="genre">';
        //Käydään rivit läpi 
        foreach($rows as $row){
            $html .= '<option>' . $row["genre"] . '</option>';  
        }
        
        $html .= '</select></div>';
        return $html;
    }