<?php
$nombre = ['1','3','2'];
$autre = ['1','2','3'];

for($i = 0; $i <= 2; $i++){
    if($nombre [$i] != $autre [$i]){
      print "les tableau ne sont pas identique";
      $i = 4;  
    }
}
if($i == 3){
    echo "les tableau sont identique";
}
   





?>