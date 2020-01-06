<?php
function croissant($tab){
    $a = 1;
    while ($a < count($tab)){
        if ($tab[$a] < $tab[$a - 1]){
            return false;
        }
        $a++;
    }
    return true; 
}

$i = true; 
$tab = [];
while($i == true){
    $a = trim(fgets(STDIN));
    if($a == "ok"){
        array_pop($tab); 
        print "c'est fini\n";
        $i = false;
    } else {
        $tab[] = $a;
    }
}

if (croissant($tab)){
    print "le tableau est croissant";
}else{
    print "le tableau n'est pas croissant";
}




?>