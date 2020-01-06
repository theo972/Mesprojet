<?php
function println(string $str){
	echo $str . PHP_EOL;
}
class Character { // ICI ON CREER LA CLASSE PERSONNAGE 
	protected $_name; 
	protected $_strenght;
	protected $_life;
	protected $_initiative;
	protected $_class; // LA ON CREER LES ATTRIBUTS DE LA CLASSE PERSONNAGE A SAVOIR FORCE, VIE, INITIATIVE, NOM ET CLASSE

	public function hit(Character $hitCharacter) {
		$target = "O";
		if ($hitCharacter->_class == "Warrior") {
			/*$hitCharacter->_life -= ($this->_strenght - $hitCharacter->_shield);
			echo $this->_name, " inflicts ", $this->_strenght, " damagegs to ", $hitCharacter->_name, " but the shiel absorbs ", $hitCharacter->_shield, " damages".PHP_EOL;
			echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;*/
			$target = "W";
		}
		if ($this->_class == "Wizard"){
			if ($target == "W") {
				$hitCharacter->_life -= ($this->_strenght + $this->_degMagic) - $hitCharacter->_shield;
				echo $this->_name, " inflicts ", $this->_strenght, " damages plus ", $this->_degMagic, " magic damages but ", $hitCharacter->_name, "'s shield absorbs ",  $hitCharacter->_shield, " damages".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
				$this->_degMagic = $this->_degMagic/2;
			}
			else {
				$hitCharacter->_life -= ($this->_strenght + $this->_degMagic);
				echo $this->_name, " inflicts ", $this->_strenght, " damages plus ", $this->_degMagic, " magic damages".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
			}
		}	
		else {
			if ($target == "W") {
				$hitCharacter->_life -= ($this->_strenght) - $hitCharacter->_shield;
				echo $this->_name, " inflicts ", $this->_strenght, " damages but ", $hitCharacter->_name, "'s shield absorbs ",  $hitCharacter->_shield, " damages".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
			}
			else {
				$hitCharacter->_life -= $this->_strenght; // ON CREER UNE FONCTION POUR FRAPPER UN PERSONNAGE, L'ATTRIBUT FORCE D'UN PERSO EST SOUSTRAIT A L'ATTRIBUT VIE D'UN SECOND PERSO
				echo $this->_name, " inflicts ", $this->_strenght, " damages !".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
			}
		}
		if ($this->_class == "Priest"){
			if ($target == "W") {
				$hitCharacter->_life -= ($this->_strenght + $this->_heal) - $hitCharacter->_shield;
				echo $this->_name, " inflicts ", $this->_strenght, " damages plus ", $this->_degMagic, " magic damages but ", $hitCharacter->_name, "'s shield absorbs ",  $hitCharacter->_shield, " damages".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
			}else {
				$hitCharacter ->_life + ($this->_strenght + $this->_heal);
				echo $this->_name, " inflicts ", $this->_strenght, " damages".PHP_EOL;
				echo $hitCharacter->_name ," now has ", $hitCharacter->_life, " life points".PHP_EOL;
			}
		}
	}


	public function setClass($class) {
			$this->_class = $class; // SETCLASS EST UNE FONCTION POUR ATTRIBUER A L'OBJET QUE L'ON TRAITE ($this) UNE VALEUR ON L'UTILISERA PLUS BAS
	}

	public function setStrenght($strenght) {
		$this->_strenght = $strenght; // PAREIL POUR LA FORCE
	}

	public function setInitiative($initiative) {
		$this->_initiative = $initiative; // PAREIL POUR L'INITIATIVE
	}

	public function setLife($life) {
		$this->_life = $life; // PAREIL POUR LA VIE 
	}

	public function setName($name) {
		$this->_name = $name; // PAREIL POUR LE NOM
	}

	public function name() {
		return $this->_name; // ICI UNE FONCTION POUR RETOURNER LA VALEUR DE L'ATTRIBUT "NAME" DE L'OBJET COURANT ($this)
	}

	public function strenght() {
		return $this->_strenght; // PAREIL POUR LA FORCE
	}

	public function life() {
		return $this->_life; // PAREIL POUR LA VIE 
	}

	public function initiative() {
		return $this->_initiative; // PAREIL POUR L'INITIATIVE
	}

	public function printInfosChar() {
		echo "The character ", $this->_name, " has ", $this->_life, " health points, ", $this->_strenght, " strenght points, ", $this->_initiative, " initiative points and is a ", $this->_class.PHP_EOL;
	}  // ICI UNE FONCTION POUR AFFICHER LA VALEURS DE TOUS LES ATTRIBUTS D'UN OBJET (NAME, STRENGHT...)
}

class Warrior extends Character {
	protected $_shield = 25;
	public function shield() {
		return $this->_shield;
	}
}
class Wizard extends Character {
	protected $_degMagic = 100;
	public function degMagic() {
		return $this->_degMagic;
	}
} 
class Priest extends Character {
	protected $_heal = 35;
	public function heal() {
		return $this->_heal;
	}
}
class Thief extends Character {
	protected $degcrit = 100;
	protected $esquive = 25;
}



$characters = array(); // LA JE RANGE LES OBJETS DANS UN TABLAU MAIS JE SAIS PAS SI CA VA SERVIR
$charactersFight = array();

$i = 0;
$o = 1;
echo "WELCOME AT THE \"KING OF FIGHTING\"".PHP_EOL.PHP_EOL; // LA LE MENU COMMENCE VOUS DEVRIEZ COMPRENDRE
while ($i != 1) {
echo "1. Character creation".PHP_EOL;
echo "2. Character list".PHP_EOL;
echo "3. Start fighting".PHP_EOL;
echo "4. Quit game".PHP_EOL;
echo "5. Help".PHP_EOL;

$inputUser = trim(fgets(STDIN)); // ON RECUPERE LA REPONSE DE L'UTILISATEUR AVEC LES INPUTS
switch ($inputUser) {
	case "1" :
		if ($o > 5) {
			echo "You already have 6 characters created, please delete one if you want to create a new one".PHP_EOL;
			break;
		}
		else {
			${"char" . $o} = new Character;
			$i = 0;
			echo "Select your character's class :".PHP_EOL;
			echo "1. Warrior".PHP_EOL;
			echo "2. Wizard".PHP_EOL;
			echo "3. Priest".PHP_EOL;
			echo "4. Thief".PHP_EOL;
			while ($i != 1) {
			$inputClassChoice = trim(fgets(STDIN));
			switch ($inputClassChoice) {
				case "1" :
					${"char" . $o} = new Warrior;
					${"char" . $o}->setClass("Warrior"); // AVEC CETTE SYNTAXE $nomDeLobjet->setAttribut(valeurDeLattribut) ON DONNE UNE VALEUR A L'ATTRIBUT D'UN OBJET (ici $char1)
					$i = 1;
					break;
				case "2" :
					${"char" . $o} = new Wizard;
					${"char" . $o}->setClass("Wizard");
					$i = 1;
					break;
				case "3" :
					${"char" . $o} = new Priest;
					${"char" . $o}->setClass("Priest");
					$i = 1;
					break;
				case "4" :
					${"char" . $o}->setClass("Thief");
					$i = 1;
					break;
				default :
					echo "Enter a number between 1 and 4 :";
			}
			}
			$i = 0;
			echo "Enter the number of health point your character will have (between 1 and 1000) : ";
			while ($i != 1) {
				$inputLifeChoice = trim(fgets(STDIN));
				if ($inputLifeChoice >= 1 && $inputLifeChoice <= 1000) {
					${"char" . $o}->setLife($inputLifeChoice);
					$i = 1;
				}
				else {
					echo "You have to enter a number of health points between 1 and 1000".PHP_EOL;
				}
			}
			$i = 0;
			echo "Enter the number of strenght point of your character (between 1 and 100) : ";
			while ($i != 1) {
				$inputStrenghtPoint = trim(fgets(STDIN));
				if ($inputStrenghtPoint >= 1 && $inputStrenghtPoint <= 100) {
					${"char" . $o}->setStrenght($inputStrenghtPoint);
					$i = 1;
				}
				else {
					echo "You have to enter a number of strenght points between 1 and 100".PHP_EOL;
				}
			}
			$i = 0;
			echo "Enter the number of initiative point (decides wether you will attack first or not) of your character (between 1 and 100) : ";
			while ($i != 1) {
				$inputInitiativePoint = trim(fgets(STDIN));
				if ($inputInitiativePoint >= 1 && $inputInitiativePoint <= 100) {
					${"char" . $o}->setInitiative($inputInitiativePoint);
					$i = 1;
				}
				else {
					echo "You have to enter a number of initiative points between 1 and 100".PHP_EOL;
				}
			}
			$i = 0;
			echo "Finally, enter the name of your character : ";
			while ($i != 1) {
				$inputCharName = trim(fgets(STDIN));
				if (ctype_alpha($inputCharName)) {
					${"char" . $o}->setName($inputCharName);
					$i = 1;
				}
				else {
					echo "You have to enter a valid name".PHP_EOL;
				}
			}
			echo "Character created successfully".PHP_EOL.PHP_EOL;
			array_push($characters, ${"char" . $o});
			$o++;
			$i = 0;
		}
		break;
	case "2" :
		while ($i != 1) {
			echo "This is the list of available characters : ".PHP_EOL.PHP_EOL;
			$i = 1;
			foreach ($characters as $values) {
				echo $i, ". ", $values->name().PHP_EOL;
				$i++;
			}
			$i = 0;
			echo "Type the number of the character if you want more informations, Q to come back to the menu".PHP_EOL;
			$inputChoice = trim(fgets(STDIN));
			if ($inputChoice == "Q" || $inputChoice == "q") {
				$i = 1;
			}
			else if ($characters[$inputChoice - 1]) {
				echo ($characters[$inputChoice - 1])->printInfosChar().PHP_EOL;
				echo "Press a key".PHP_EOL;
				fgets(STDIN);
			}
		}
		break;
	case "3" :
		echo "Welcome to the battle menu !".PHP_EOL;
		echo "Choose the first character you want to see fight by typing its number :".PHP_EOL;
		$i = 1;
		foreach ($characters as $values) {
			echo $i, ". ", $values->name().PHP_EOL;
			$i++;
		}
		$i = 0;
		while ($i != 1) {
			while ($i != 1) {
				$inputFirstCharChoice = trim(fgets(STDIN));
				if (!$characters[$inputFirstCharChoice - 1]) {
					echo "You have to type the number of an existing character on the list";
				}
				else {
					array_push($charactersFight, $characters[$inputFirstCharChoice - 1]);
					$i = 1;
				}
			}
			$i = 0;
			echo "Now choose the second character :".PHP_EOL;
			while ($i != 1) {
				$inputSecondCharChoice = trim(fgets(STDIN));
				if ($characters[$inputSecondCharChoice - 1] == false) {
					echo "You have to type the number of an existing character on the list";
				}
				else {
					array_push($charactersFight, $characters[$inputSecondCharChoice - 1]);
					$i = 1;
				}
			}
			echo $charactersFight[0]->name(), " and ", $charactersFight[1]->name(), " will fight".PHP_EOL;
			while ($charactersFight[0]->life() > 0 && $charactersFight[1]->life() > 0) {
				if ($charactersFight[0]->initiative() > $charactersFight[1]->initiative()) {
					echo "As he has more initiative, ", $charactersFight[0]->name(), " attacks first".PHP_EOL; 
					$charactersFight[0]->hit($charactersFight[1]);
					if ($charactersFight[1]->life() <= 0) {
						echo $charactersFight[1]->name(), " is dead. The fight is over and ", $charactersFight[0]->name(), " is the winner !".PHP_EOL;
					}
					else {
						$charactersFight[1]->hit($charactersFight[0]);
						if ($charactersFight[0]->life() <= 0) {
							echo $charactersFight[0]->name(), " is dead. The fight is over and ", $charactersFight[1]->name(), " is the winner !".PHP_EOL;
						}
					}
				}
				else {
					echo "As he has more initiative, ", $charactersFight[1]->name(), " attacks first".PHP_EOL; 
					$charactersFight[1]->hit($charactersFight[0]);
					if ($charactersFight[0]->life() <= 0) {
						echo $charactersFight[0]->name(), " is dead. The fight is over and ", $charactersFight[1]->name(), " is the winner !".PHP_EOL;
					}
					else {
						$charactersFight[0]->hit($charactersFight[1]);
						if ($charactersFight[1]->life() <= 0) {
							echo $charactersFight[1]->name(), " is dead. The fight is over and ", $charactersFight[0]->name(), " is the winner !".PHP_EOL;
						}
					}
				}
			}
		}

		break;
	case "4" :
		exit;
	case "5" :
		$i = 0;
		echo "Hello ! need some help ?".PHP_EOL;
		echo "The King of Fighting is a combat game where you can create characters and make them fight each other".PHP_EOL;
		echo "The first command \"1. Character creation\" allows you to create a character and design him as you want".PHP_EOL;
		echo "The second option \"2. Character list\" allows you to see the list of characters available, created or not and delete them if you want".PHP_EOL;
		echo "The third option \"3. Start fighting\" allows you to choose two characters of your choice and see them fight".PHP_EOL;
		echo "Have a good game !".PHP_EOL.PHP_EOL;
		echo "Type \"Q\" to quit".PHP_EOL;
		while ($i != 1) {
			$inputQuit = trim(fgets(STDIN));
			if ($inputQuit == "Q" || "q") {
				$i = 1;
			}
		}
		break;
	default :
	echo "You have to enter a number in the list".PHP_EOL;
}
$i = 0;
}

?>