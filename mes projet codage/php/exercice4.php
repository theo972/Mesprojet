<?php
$epargne = 100;
$année = 2010;
$annéejour = 2019;

while($année <= 2019){
    $année++;
    $epargne = $epargne + 1200 * 1.02;
    echo "\n" . $epargne;
}
?>