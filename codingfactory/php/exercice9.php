<?php

function Voyelle($lettre){
    return $lettre == "a" || $lettre == "e" || $lettre == "i" || $lettre == "o" || $lettre == "u" || $lettre == "y";
 } 
 function nombre ($chaine){
     $nombre = 0;
     $i = 0;
     while($i <strlen($chaine)){
         $i++;
         if(Voyelle($chaine[$i])){
             $nombre++;
         }

     }
     print "il y a " . $nombre . " de voyelle";
     return($nombre);
}
$chaine = trim(fgets(STDIN));
nombre($chaine);



?>