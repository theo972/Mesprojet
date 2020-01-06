<?php

print " veillez ecrire l'année : ";
$mois = trim(fgets(STDIN));
print " l'année est ". $mois;
if ($mois % 4 == 0 && $mois % 400 == 0 && $mois % 100 == 1){
    print " l'année est bisextille\n";
} if($mois % 4 == 0 && $mois % 400 == 0){
    print "l'année est bisetille\n";
}  else{
    print "elles est pas bisectille\n";
}




?>