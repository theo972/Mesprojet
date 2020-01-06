<?php
print "suite de fibbonati";
$a = 0;
$b = 0;
$c = 1;

while($a <= 50){
    $b = $b + $b;
    $b = $c - $b;
    $tab [] =  $b; 
    $a++;
    
}
print_r($tab);
?>