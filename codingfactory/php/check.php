<?php
	//saut de ligne auto
	function println(string $str){
		echo $str . PHP_EOL;
	}
	//AFICHER TABLEAU
	function show_player_board($player_board) {
		for ($col=0; $col < 10; $col++) { 
			for ($line=0; $line < 10; $line++) {
            
			}
			println("");
		}
	}	
	/*Initialise le tableau du joueur
	*100% copiable pour le faire pour l'ordi*/
	function init_player_board($player_board) {
		for ($col=0; $col < 10; $col++) { 
			for ($line=0; $line < 10; $line++) { 
				$player_board[$line][$col] = "~";
				print($player_board[$line][$col] . " ");
			}
			println("");
		}
		println("TABLEAU JOUEUR INITIALISE");
	}
	$player_board = array();
	init_player_board($player_board);
	println("Veuillez entrer la coordonnée de début et son orientation (Ex: A4-L ou b8-C).");
	$boat0 = trim(fgets(STDIN));
	$boat0 = strtoupper($boat0);
	$boat0 = str_replace(" ", "", $boat0);
	$boat0 = str_split($boat0);
	if ($boat0[0] >= "A" && $boat0[0] <= "J")
		print_r($boat0[0] . PHP_EOL);
	$boat0[1] = $boat0[1] - 1;
	if ($boat0[1] >= "0" && $boat0[1] <= "9")
		print_r($boat0[1] + 1 .PHP_EOL);
	$player_board[$boat0[0]][$boat0[1]] = "M";
	show_player_board($player_board);
?>