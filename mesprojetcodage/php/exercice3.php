<?php 
print "date de naissance\n";
print "----------------------------------\n";
print " ecriver le jour de votre naissance : ";
$jour = trim(fgets(STDIN));
print "\n ecriver le mois de votre naissance : ";
$mois = trim(fgets(STDIN));
print "\n ecriver l'année de votre naissance : ";
$année = trim(fgets(STDIN));
print "votre date de naissance est : " . $jour . "/" . $mois . "/" . $année;
$dateAnnée = 2019;
$age = 0;
while ($année < $dateAnnée){
    $age ++ ;
    $année ++;
}
print "\n votre age est : " . $age;

?>