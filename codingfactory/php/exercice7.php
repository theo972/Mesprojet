<?php
print "\n ecrivez les nombre de votre tableau";
print "\n ecrivez OK pour arreter\n";
$p = [];
$i = true; 
while($i == true){
    $a = trim(fgets(STDIN));
    if($a == "ok"){
        print "c'est fini\n";
        $i = false;
    } else {
        $p[] = $a;
    }
}
print_r($p);
$t = count ($p);
print "il y a $t chose dans ton tableau\n";
$s = 0;

for($u = 0;$u < $t;$u++){
    $m = $p[$u];
    $s = $s + $m;
    $u++; 
   }
 print "le total des valeur du tableau est : " . $s;
 print "\n la moyenne est : " . $s / $t;
