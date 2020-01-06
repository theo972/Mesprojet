<?php

$variable1 = 2.7;
$variable2 = 1.9;

//minute
$variable3 = $variable1 - $variable2;
echo "en une minute il y a une varation de la population de $variable3\n";
$variable4 = $variable3 * 60;
echo "en une minute il y a une variation de la population de $variable4\n";
$variable4 = $variable3 * 60 * 60;
echo "en une heure $variable4\n";
$variable4 = $variable3 * 60 * 60 * 24;
echo "en une journée $variable4\n";
$variable4 = $variable3 * 360;
echo "en une anne $variable4";

?>