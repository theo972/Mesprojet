<?php
	//clear les logs
	function cls() {
		if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
			system('cls');
		}
		else {
			system('clear');
		}
	}
	//saut de ligne auto
	function println(string $str){
		echo $str . PHP_EOL;
	}
	function show_player_board($player_board) {
		cls();
		for ($col=0; $col < 10; $col++) { 
			for ($line=0; $line < 10; $line++)
				print($player_board[$line][$col] . " ");
			println("");
		}
		return $player_board;
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
		return $player_board;
    }
    function init_ia_board($ia_board) {
		for ($col=0; $col < 10; $col++) { 
			for ($line=0; $line < 10; $line++) { 
				$ia_board[$line][$col] = "~";
				print($ia_board[$line][$col] . " ");
			}
			println("");
		}
		return $ia_board;
	}
	function place_boat($loop, $player_board, $basexyd) {
		if ($loop == "line") {
			while ($basexyd[3] >= $basexyd[1]) {
					$player_board[$basexyd[0]][$basexyd[1]] = "B";
					if ($basexyd[1] <= 9)
						$basexyd[1]++;
			}
		}
		else
			while ($basexyd[2] >= $basexyd[0]) {
					$player_board[$basexyd[0]][$basexyd[1]] = "B";
					if ($basexyd[0] <= 9)
						$basexyd[0]++;
			}
		return $player_board;
	}
	//Vérifier si le bateau peut s'installer (en colonne)
	function check_co_boat_col($loop, $player_board, $xyd) {
		while ($xyd[2] >= $xyd[0]) {
			if ($player_board[$xyd[0]][$xyd[1]] != "~")
				break;
			if ($xyd[0] < 9)
				$xyd[0]++;
			else
				break;
		}
		if ($xyd[0] >= $xyd[2])
			return $loop = "col";
		else {
			println("Votre bateau est en collision ou dans le territoire d'un autre !");
			return $loop = true;
		}
	}
	//Vérifier si le bateau peut s'installer (en ligne)
	function check_co_boat_line($loop, $player_board, $xyd) {
		while ($xyd[3] >= $xyd[1]) {
			if ($player_board[$xyd[2]][$xyd[3]] != "~")
				break;
			if ($xyd[1] < 9)
				$xyd[1]++;
			else
				break;
		}
		if ($xyd[1] >= $xyd[3])
			return $loop = "line";
		else {
			println("Votre bateau est en collision ou dans le territoire d'un autre !");
			return $loop = true;
		}
	}
	//Entre les coordonnées du bateau
	function enter_co_boat($xyd, $player_board) {
		$nbboat = 5;
		while ($nbboat > 0) {
			println("Il vous reste $nbboat restants.");
			$loop = "true";
			while ($loop == "true") {
				$xyd = trim(fgets(STDIN));
				$xyd = str_replace(" ", "", $xyd);
				$xyd = strtoupper($xyd);
				$xyd = str_split($xyd);
				println("J'AI ENTRE " . count($xyd) . " CARACTERES");
				//ADAPTATION DE NOMBRE A 2 CASES
				if (count($xyd) == 6) {
					if ($xyd[1] == "1" && $xyd[2] == "0" && $xyd[4] == "1" && $xyd[5] == "0") {
						$xyd[1] = "10";
						$xyd[2] = $xyd[3];
						$xyd[3] = "10";
						unset($xyd[4]);
						unset($xyd[5]);
					}
				}
				else if (count($xyd) == 5) {
					if ($xyd[1] == "1" && $xyd[2] == "0") {
						$xyd[1] = "10";
						$xyd[2] = $xyd[3];
						$xyd[3] = $xyd[4];
					}
					else {
						$xyd[3] = "10";
					}
					unset($xyd[4]);
				}
				print_r($xyd);
				$xyd[0] = (ord($xyd[0]) - 65);
				$xyd[1]--;
				if ($xyd[1] == "10")
					$xyd[1] = 9;
				$xyd[2] = (ord($xyd[2]) - 65);
				$xyd[3]--;
				if ($xyd[3] == "10")
					$xyd[3] = 9;
				//VERIFICATION
				print_r($xyd);
				if ($xyd[0] >= "0" && $xyd[0] <= "9" && $xyd[1] >= "0" && $xyd[1] <= "9" && $xyd[2] <= "9" && $xyd[3] <= "9") {
					$basexyd = $xyd;
					if ($xyd[2] > $xyd[0] && $xyd[3] == $xyd[1])
						$loop = check_co_boat_col($loop, $player_board, $xyd);
					else if ($xyd[2] == $xyd[0] && $xyd[3] > $xyd[1])
						$loop = check_co_boat_line($loop, $player_board, $xyd);
					else
						println("Vous ne pouvez pas placer un bateau en diagonale !");
				}
				else
					println("Veuillez respecter la syntaxe.");
			}
			$player_board = place_boat($loop, $player_board, $basexyd);
			show_player_board($player_board);
			$nbboat--;
		}
		return $player_board;
    }
    function ia_random_tir($ia_board){
		
		$coord_A = random_int(0, 9);
		$coord_B = random_int(0, 9);

		$val_tir_IA = $coord_A.$coord_B;
        println("\nc'est le tour de l'ia \n");
		// echo $val_tir_IA."\n";

		for ($col = 0 ; $col < 10; $col++){
			for ($line= 0; $line < 10; $line++) {
				if ($col == $coord_A && $line == $coord_B) {
					echo "O ";
					
				}else {
				$ia_board[$line][$col] = "~";
				print($ia_board[$line][$col] . " ");
				
                }
            }
        if($coord_A == "O" && $coord_B == "O"){
           println("tu as deja tire ici c'est inutile");
        }
        if($coord_A == "X" && $coord_B == "X"){
            println("tu as deja toucher le bateau");
		}
		if($coord_A == "~" && $coord_B == "~"){
			println("tu as reussi a toucher bateau");
		}
        println(" ");	
        return($ia_board);
        
	}	
}

function playertir($coord_A, $coord_B){

    $val_tir_IA = $coord_A * $coord_B;

        echo $val_tir_IA."\n";
        
        for ($col = 0 ; $col < 10; $col++){
            for ($line= 0; $line < 10; $line++) {
                if ($col == $coord_A && $line == $coord_A) {
                    echo "X ";

                }else {
                $player_board[$line][$col] = "~";
                print($player_board[$line][$col] . " ");

                }
            }
        if($col == "O" && $line == "O"){
           println("tu as deja tire ici c'est inutile");
        }
        if($col == "X" && $line == "X"){
        println("tu as deja toucher le bateau");
        println(" "); 

	    }
    }
}   

    println("tableau du joueur");
	$player_board = array();
    $player_board = init_player_board($player_board);
    $xyd = "";
    println("tableau de l'ia");
    $ia_board = array();
    $ia_board = init_player_board($ia_board);
    println(" ");
    $player_board = enter_co_boat($xyd, $player_board);
    println("");
    $ia_board = ia_random_tir($ia_board); 
?>