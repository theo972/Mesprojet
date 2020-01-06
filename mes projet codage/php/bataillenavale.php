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
		//print_r($player_board);
		return $player_board;
	}
	function enter_co_boat($xyd) {
		$loop = true;
		while ($loop == true) {
			println("Veuillez entrer la coordonnée de début et son orientation (Ex: \"A10 L\" ou \"A5 C\").");
			$xyd = trim(fgets(STDIN));
			$xyd = str_replace(" ", "", $xyd);
			$xyd = strtoupper($xyd);
			$xyd = str_split($xyd);
			if (count($xyd) == 3)
			{
				if ($xyd[0] >= "A" && $xyd[0] <= "J" && $xyd[1] >= "1" && $xyd[1] <= "9" && ($xyd[2] == "L" || $xyd[2] == "C")) {
					$loop = false;
				}
			}
			else if (count($xyd) == 4)
			{
				if ($xyd[0] >= "A" && $xyd[0] <= "J" && $xyd[1] == "1" && $xyd[2] == "0" && ($xyd[3] == "L" || $xyd[3] == "C")) {
					$xyd[0] = $xyd[0];
					$xyd[1] = 10;
					$xyd[2] = $xyd[3];
					$loop = false;
				}
			}
			else
				println("Veuillez respecter la syntaxe.");
		}
		return $xyd;
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
	function ia_random_tir(){
		
		$coord_A = random_int(0, 9);
		$coord_B = random_int(0, 9);

		$val_tir_IA = $coord_A.$coord_B;

		echo $val_tir_IA."\n";

		for ($col = 0 ; $col < 10; $col++){
			for ($line= 0; $line < 10; $line++) {
				if ($col == $coord_A && $line == $coord_B) {
					echo "O ";
					
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
        }
        println(" ");	
	}	
}
// 	function playertir(){
// 	$coord_A = trim(fgets(STDIN));
	
// 	$val_tir_IA = $coord_A.$coord_B;

// 		echo $val_tir_IA."\n";
    
// 		for ($col = 0 ; $col < 10; $col++){
// 			for ($line= 0; $line < 10; $line++) {
// 				if ($col == $coord_A && $line == $coord_A) {
// 					echo "X ";
					
// 				}else {
// 				$player_board[$line][$col] = "~";
// 				print($player_board[$line][$col] . " ");
				
//                 }
//             }
//         if($col == "O" && $line == "O"){
//            println("tu as deja tire ici c'est inutile");
//         }
//         // if($col == "X" && $line == "X"){
//         //     println("tu as deja toucher le bateau");
// 		println(" "); 
// 	}
       	
// }	
// // }
function playertir($xy){

    $loop = true;
		while ($loop == true) {
			println("Veuillez entrer la coordonnée de début et son orientation (Ex: \"A10 L\" ou \"A5 C\").");
			$xy = trim(fgets(STDIN));
			$xy = str_replace(" ", "", $xy);
			$xy = strtoupper($xy);
			$xy = str_split($xy);
			if (count($xyd) == 3)
			{
				if ($xy[0] >= "A" && $xy[0] <= "J" && $xy[1] >= "1" && $xy[1] <= "9" && ($xy[2] == "L" || $xy[2] == "C")) {
					$loop = false;
				}
			}
			else if (count($xyd) == 4)
			{
				if ($xy[0] >= "A" && $xy[0] <= "J" && $xy[1] == "1" && $xy[2] == "0" && ($xy[3] == "L" || $xy[3] == "C")) {
					$xy[0] = $xy[0];
					$xy[1] = 10;
					$xy[2] = $xy[3];
					$loop = false;
				}
			}
			else
				println("Veuillez respecter la syntaxe.");
		}
		return $xy;
	}

    // $coord_A = trim(fgets(STDIN));
    // $coord_B = trim(fgets(STDIN));
	$player_board = array();
	$player_board = init_player_board($player_board);
    $xy = "";
	$xyd = "";
	$xyd = enter_co_boat($xyd); 
	println ("LETTRE " . $xyd[0] . " OK");
	$xyd[0] = (ord($xyd[0]) - 65);
	println ("CHIFFRE " . $xyd[1] . " OK");
	println ("DIRECTION " . $xyd[2] . " OK");
	println ("LETTRE (Num et tableau) " . $xyd[0] . " OK");
	$xyd[1]--;
	println ("CHIFFRE (tableau) " . $xyd[1] . " OK");
	$player_board[$xyd[0]][$xyd[1]] = "B";
	show_player_board($player_board);
	println("tour du joueur de demaner ou tire");
	// playertir($xy);
	// $player_board[$xy[0]][$xy[1]] = "x";
    // println("tour de l'ia");
	// ia_random_tir();

?>