 CREATE DATABASE IF NOT EXISTS Projet_4 CHARACTER SET "utf8";
USE Projet_4;
CREATE USER 'Théo'@'10.41.30.87' IDENTIFIED BY '123';
CREATE USER 'Julien'@'10.138.33.154' IDENTIFIED BY '456';
GRANT ALL PRIVILEGES ON * . * TO 'Théo'@'10.41.30.87';
GRANT ALL PRIVILEGES ON * . * TO 'Julien'@'10.138.33.154';
FLUSH PRIVILEGES;

CREATE TABLE utilisateurs (
     id_utilisateur INT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
     nom_utilisateur VARCHAR(15) NOT NULL,
     prenom_utilisateur VARCHAR(15) NOT NULL ,
     numero_utilisateur VARCHAR(15) UNIQUE,
     adresse_utilisateur VARCHAR(40),
     CP_utilisateur VARCHAR(5),
     mail_utilisateur VARCHAR(30) NOT NULL UNIQUE,
     mdp_utilisateur VARCHAR(100) NOT NULL ,
     type_utilisateur VARCHAR(10),
     PRIMARY KEY (id_utilisateur)

);

CREATE TABLE piece (
    id_piece INT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_piece VARCHAR(15) NOT NULL,
    id_proprio VARCHAR (5) UNSIGNED NOT NULL,
    description_piece VARCHAR (255),
    PRIMARY KEY (id_piece)
);

ALTER TABLE piece ADD FOREIGN KEY(id_proprio) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE aliments (
    id_aliment INT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
    id_piece_aliment INT (5) UNSIGNED NOT NULL,
    nom_aliment VARCHAR(20),
    date_peremption VARCHAR(12),
    quantite_aliment INT(10),
    PRIMARY KEY (id_aliment)
);

ALTER TABLE aliments ADD FOREIGN KEY(id_piece_aliment) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE capteur_temperature (
        id_cap_temp INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
        nom_logique VARCHAR(30),
        id_piece_capteur INT(5) UNSIGNED,
        status_capteur VARCHAR(3),
        interval_capteur VARCHAR(20),
        temp_mini VARCHAR(10),
        temp_maxi VARCHAR(10),
    PRIMARY KEY (id_cap_temp)
);

-- ALTER TABLE capteur_temperature ADD FOREIGN KEY(id_cap_temp) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE donnees_temperature (
    id_capteur_temp INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    valeur_temp VARCHAR(5),
    date_heure_acquisition DATETIME,
    PRIMARY KEY (id_capteur_temp)
);

-- ALTER TABLE donnees_temperature ADD FOREIGN KEY(id_capteur_temp) REFERENCES capteur_temperature(id_cap_temp) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE thermostats (
    id_piece_thermostats INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_thermostat VARCHAR(15),
    id_capteur_1 INT(5) UNSIGNED NOT NULL,
    id_capteur_2 INT(5) UNSIGNED NOT NULL,
    temp_cible VARCHAR(10),
    status_thermostat VARCHAR(10),
    PRIMARY KEY (id_piece_thermostats)
);

ALTER TABLE thermostats ADD FOREIGN KEY(id_piece_thermostats) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE thermostats ADD FOREIGN KEY(id_piece_thermostats) REFERENCES capteur_temperature(id_cap_temp) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE thermostats ADD FOREIGN KEY(id_piece_thermostats) REFERENCES donnees_temperature(id_capteur_temp) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE ampoules_connectees (
    id_ampoule_connectee INT(5) UNSIGNED AUTO_INCREMENT,
    nom_ampoule VARCHAR (30),
    id_piece_ampoule INT(5) UNSIGNED,
    status_ampoule VARCHAR (10),
    couleur_lumiere VARCHAR (30),
    heure_allumage VARCHAR (5),
    PRIMARY KEY (id_ampoule_connectee)
);

ALTER TABLE ampoules_connectees ADD FOREIGN KEY(id_piece_ampoule) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE donnees_ampoules (
    id_valeur_ampoule INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    id_ampoule INT(5) UNSIGNED,
    action_ampoule VARCHAR (10) NOT NULL,
    date_action DATETIME,
    PRIMARY KEY (id_valeur_ampoule)
);

ALTER TABLE donnees_ampoules ADD FOREIGN KEY(id_ampoule) REFERENCES ampoules_connectees(id_ampoule_connectee) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE camera_installlees (
    id_camera INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_camera VARCHAR (30),
    id_piece_camera INT(5) UNSIGNED,
    status_camera VARCHAR(3),
    distance_min_detec VARCHAR(10),
    date_debut_surveillance DATETIME,
    date_fin_surveillance DATETIME,
    PRIMARY KEY (id_camera)

);

ALTER TABLE camera_installlees ADD FOREIGN KEY(id_piece_camera) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE photo (
    id_photo INT(5) UNSIGNED NOT NULL AUTO_INCREMENT
    id_camera INT(5) UNSIGNED,
    date_capture DATETIME,
    chemin_image VARCHAR(40),
    PRIMARY KEY (id_photo)
);

ALTER TABLE photo ADD FOREIGN KEY(id_camera) REFERENCES camera_installlees(id_camera) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO utilisateurs
VALUES 
(1, "Bastide", "Anis","0676537592","76 rue des courlis","95100","anisbastide@gmail.com","azerty25565","normal")
(2, "Pelerin", "Axel","0784532818","8 avenue porte de champerret","75017","axelpelerin@gmail.com","alerjce1001","normal")
(3, "Lai", "Jimmy","0643821193","8 avenue porte de champerret","75017","jimmylai@gmail.com","ejfhz6ghej1","normal")
(4, "Tran-Tao", "Arthur","0725647201","76 rue des courlis","95100","arthurtrantao@gmail.com","wscfbhnjue","normal")
(5, "Viseux", "Julien","0781585528","76 rue des courlis","95100","julienviseux@gmail.com","poiuytre25565","admin")
(6, "Moutty", "Théo","0672980028","8 avenue porte de champerret","75017","theomoutty@gmail.com","plijygrdes","admin")

INSERT INTO piece
VALUES
(1,'cuisine','1',"pièce avec de grands plzans de travail pour cuisiner"),
(2,'salon','1',"grand salon avec deux canapés et une tables basse"),
(3,'salle à manger','1',"une grande table avec 6 places, très éclairée"),
(4,'cuisine','2',"cusine spacieuse avec un plan de travail central"),
(5,'salon','2',"salon avec un canapé en angle avec une très grande table basse"),
(6,'salle à manger','2',"grande table pouvant acceuillir 6 personne et pouvant s'agrandir pour 12 personnes"),
(7,'chambre','1',"plus grande chambre avec un mini frigo"),
(8,'salière','2',"petite pièce pour stocker de la nourriture"),
(9,'chambre','2',"une autre chambre, plus petite, mais tout aussi confort"),
(10,"atelier","2","la salle pour bricoler, au sous-sol");

INSERT INTO aliments
VALUES
(1,1,"fromage","2019-11-20",10),
(2,2,"fraise","2019-11-20",4),
(3,2,"pomme","2019-11-20",9),
(4,1,"yaourt","2019-11-20",8),
(5,2,"poire","2019-11-20",7),
(6,1,"steak","2019-11-20",6),
(7,3,"oasis","2019-11-20",6),
(8,1,"olives","2019-11-20",30),
(9,1,"salade","2019-11-20",1),
(10,1,"poulet","2019-11-20",2),
(11,4,"pomme de terre","2019-11-20",20),
(12,4,"compote","2019-11-20",9),
(13,5,"biscuit","2019-11-20",7),
(14,5,"bonbon","2019-11-20",5),
(15,6,"pain","2019-11-20",3),
(16,4,"riz","2019-11-20",5),
(17,4,"courgette","2019-11-20",4),
(18,4,"pizza","2019-11-20",3),
(19,4,"burger","2019-11-20",18),
(20,4,"avocat","2019-11-20",12),
(21,4,"merguez","2019-11-20",10),
(22,4,"nouille","2019-11-20",4),
(23,9,"jus d'orange","2019-11-20",3),
(24,4,"pate","2019-11-20",2),
(25,4,"tomate","2019-11-20",4);


INSERT INTO capteur_temperature
VALUES  
(1,'capteur entrée cuisine',1,'on','10s','-30','+80'),
(2,'capteur frigo cuisine',1,'off','10s','-30','+80'),
(3,'capteur fenêtre cusine',1,'off','10s','-30','+80'),
(4,'capteur fenêtre salon',2,'on','10s','-30','+80'),
(5,'capteur derrière canapé',2,'on','10s','-30','+80'),
(6,'capteur porte salon',2,'off','10s','-30','+80'),
(7,'capteur fenêtre salle à manger',3,'on','10s','-30','+80'),
(8,'ccapteur meuble salle à manger',3,'off','10s','-30','+80'),
(9,'capteur porte salle à manger',3,'on','10s','-30','+80'),
(10,'capteur cuisine plan',4,'off','10s','-30','+80'),
(11,'capteur cuisine frigo',4,'off','10s','-30','+80'),
(12,'porte vitrée salon',5,'off','10s','-30','+80'),
(13,'capteur fenêtre vitrée',5,'on','10s','-30','+80'),
(14,'ccapteur table',6,'off','10s','-30','+80'),
(15,'capteur salle à manger',6,'on','10s','-30','+80'),
(16,'capteur lit chambre 1',7,'off','10s','-30','+80'),
(17,'capteur bureau chambre 1',7,'on','10s','-30','+80'),
(24,'capteur armoire chambre 1',7,"on",'10s','-30','+80'),
(18,'capteur entrée salière',8,'on','10s','-30','+80'),
(19,'capteur armoire salière',8,'off','10s','-30','+80'),
(20,'capteur lit chambre 2',9,'on','10s','-30','+80'),
(21,'capteur meuble chambre 2',9,'on','10s','-30','+80'),
(22,'capteur plan atelier',10,'on','10s','-30','+80'),
(23,'capteur de temperature',10,'on','10s','-30','+80');

INSERT INTO donnees_temperature
VALUES
(1,1,"10°C","2019-07-22 12:00:00"),
(2,1,"10°C","2019-07-22 12:00:00"),
(3,1,"10°C","2019-07-22 12:00:00"),
(4,1,"10°C","2019-07-22 12:00:00"),
(5,1,"10°C","2019-07-22 12:00:00"),
(6,1,"11°C","2019-07-22 12:00:00"),
(7,1,"11°C","2019-07-22 12:00:00"),
(8,1,"11°C","2019-07-22 12:00:00"),
(9,1,"11°C","2019-07-22 12:00:00"),
(10,1,"11°C","2019-07-22 12:00:00"),
(11,1,"10°C","2019-07-22 12:00:00"),
(12,1,"10°C","2019-07-22 12:00:00"),
(13,1,"10°C","2019-07-22 12:00:00"),
(14,1,"10°C","2019-07-22 12:00:00"),
(15,1,"10°C","2019-07-22 12:00:00"),
(16,2,"12°C","2019-07-22 12:00:00"),
(17,2,"12°C","2019-07-22 12:00:00"),
(18,2,"12°C","2019-07-22 12:00:00"),
(19,2,"12°C","2019-07-22 12:00:00"),
(20,2,"12°C","2019-07-22 12:00:00"),
(21,2,"11°C","2019-07-22 12:00:00"),
(22,2,"11°C","2019-07-22 12:00:00"),
(23,2,"11°C","2019-07-22 12:00:00"),
(24,2,"11°C","2019-07-22 12:00:00"),
(25,2,"11°C","2019-07-22 12:00:00"),
(26,2,"12°C","2019-07-22 12:00:00"),
(27,2,"12°C","2019-07-22 12:00:00"),
(28,2,"12°C","2019-07-22 12:00:00"),
(29,2,"12°C","2019-07-22 12:00:00"),
(30,2,"12°C","2019-07-22 12:00:00"),
(31,3,"10°C","2019-07-22 12:00:00"),
(32,3,"10°C","2019-07-22 12:00:00"),
(33,3,"10°C","2019-07-22 12:00:00"),
(34,3,"10°C","2019-07-22 12:00:00"),
(35,3,"10°C","2019-07-22 12:00:00"),
(36,3,"11°C","2019-07-22 12:00:00"),
(37,3,"11°C","2019-07-22 12:00:00"),
(38,3,"11°C","2019-07-22 12:00:00"),
(39,3,"11°C","2019-07-22 12:00:00"),
(40,3,"11°C","2019-07-22 12:00:00"),
(41,3,"10°C","2019-07-22 12:00:00"),
(42,3,"10°C","2019-07-22 12:00:00"),
(43,3,"10°C","2019-07-22 12:00:00"),
(44,3,"10°C","2019-07-22 12:00:00"),
(45,3,"10°C","2019-07-22 12:00:00"),
(46,7,"13°C","2019-07-22 12:00:00"),
(47,7,"13°C","2019-07-22 12:00:00"),
(48,7,"13°C","2019-07-22 12:00:00"),
(49,7,"13°C","2019-07-22 12:00:00"),
(50,7,"13°C","2019-07-22 12:00:00"),
(51,7,"14°C","2019-07-22 12:00:00"),
(52,7,"14°C","2019-07-22 12:00:00"),
(53,7,"14°C","2019-07-22 12:00:00"),
(54,7,"14°C","2019-07-22 12:00:00"),
(55,7,"14°C","2019-07-22 12:00:00"),
(56,7,"13°C","2019-07-22 12:00:00"),
(57,7,"13°C","2019-07-22 12:00:00"),
(58,7,"13°C","2019-07-22 12:00:00"),
(59,7,"13°C","2019-07-22 12:00:00"),
(60,7,"13°C","2019-07-22 12:00:00"),
(61,4,"12°C","2019-07-22 12:00:00"),
(62,4,"12°C","2019-07-22 12:00:00"),
(63,4,"12°C","2019-07-22 12:00:00"),
(64,4,"12°C","2019-07-22 12:00:00"),
(65,4,"12°C","2019-07-22 12:00:00"),
(66,4,"12°C","2019-07-22 12:00:00"),
(67,5,"11°C","2019-07-22 12:00:00"),
(68,5,"11°C","2019-07-22 12:00:00"),
(69,5,"11°C","2019-07-22 12:00:00"),
(70,5,"11°C","2019-07-22 12:00:00"),
(71,5,"11°C","2019-07-22 12:00:00"),
(72,5,"11°C","2019-07-22 12:00:00"),
(73,6,"10°C","2019-07-22 12:00:00"),
(74,6,"10°C","2019-07-22 12:00:00"),
(75,6,"10°C","2019-07-22 12:00:00"),
(76,6,"10°C","2019-07-22 12:00:00"),
(77,6,"10°C","2019-07-22 12:00:00"),
(78,6,"10°C","2019-07-22 12:00:00"),
(79,8,"11°C","2019-07-22 12:00:00"),
(80,8,"11°C","2019-07-22 12:00:00"),
(81,8,"11°C","2019-07-22 12:00:00"),
(82,8,"11°C","2019-07-22 12:00:00"),
(83,8,"11°C","2019-07-22 12:00:00"),
(84,8,"11°C","2019-07-22 12:00:00"),
(85,9,"12°C","2019-07-22 12:00:00"),
(86,9,"12°C","2019-07-22 12:00:00"),
(87,9,"12°C","2019-07-22 12:00:00"),
(88,9,"12°C","2019-07-22 12:00:00"),
(89,9,"12°C","2019-07-22 12:00:00"),
(90,9,"12°C","2019-07-22 12:00:00"),
(91,10,"11°C","2019-07-22 12:00:00"),
(92,10,"11°C","2019-07-22 12:00:00"),
(93,10,"11°C","2019-07-22 12:00:00"),
(94,10,"11°C","2019-07-22 12:00:00"),
(95,10,"11°C","2019-07-22 12:00:00"),
(96,10,"11°C","2019-07-22 12:00:00");

INSERT INTO thermostats
VALUES

INSERT INTO ampoules_connectees
VALUES 
(1,1,1,'ampoule led','on','blanche','6h'),
(2,1,1,'ampoule led','on','Rose','10h'),
(3,1,2,'ampoule led','on','bleu','7h'),
(4,1,2,'ampoule led','on','blanche','6h'),
(5,1,3,'ampoule led','on','blanche','6h'),
(6,2,5,'ampoule led','on','vert','10h'),
(7,2,8,'ampoule led','on','jaune','19h'),
(8,2,9,'ampoule led','on','violet','8h'),
(9,2,10,'ampoule led','on','orange','20h');

INSERT INTO donnees_ampoules
VALUES
(1,1,'allumer','2019-11-25 15:46:09')
(2,1,'allumer','2019-11-25 15:46:09'),
(3,1,'eteint','2019-11-25 16:15:09'),
(4,2,'allumer','2019-11-25 16:46:09'),
(5,2,'eteint','2019-11-25 17:46:09'),
(6,2,'allumer','2019-11-25 18:30:09'),
(7,3,'eteint','2019-11-25 12:46:09'),
(8,3,'allumer','2019-11-25 13:36:09'),
(9,3,'eteint','2019-11-25 19:06:09'),
(10,4,'eteint','2019-11-25 00:46:09'),
(11,4,'allumer','2019-11-25 01:46:09'),
(12,4,'eteint','2019-11-25 05:00:09'),
(13,5,'allumer','2019-11-25 09:30:00'),
(14,5,'eteint','2019-11-25 10:30:00'),
(15,5,'allumer','2019-11-25 16:40:00'),
(16,6,'eteint','2019-11-25 06:00:00'),
(17,6,'allumer','2019-11-25 06:30:00'),
(18,6,'eteint','2019-11-25 07:46:09'),
(19,6,'allumer','2019-11-25 16:46:09'),
(20,7,'eteint','2019-11-25 10:26:09'),
(21,7,'allumer','2019-11-25 14:46:09'),
(22,7,'allumer','2019-11-25 14:56:09'),
(23,7,'eteint','2019-11-25 15:46:09'),
(24,8,'allumer','2019-11-25 16:00:09'),
(25,8,'eteint','2019-11-25 16:46:09'),
(26,8,'allumer','2019-11-25 17:26:09'),
(27,8,'eteint','2019-11-25 11:46:09'),
(28,9,'allumer','2019-11-25 13:46:09'),
(29,9,'eteint','2019-11-25 14:46:09'),
(30,9,'allumer','2019-11-25 15:46:09'),
(31,9,'eteint','2019-11-25 19:46:09');

INSERT INTO camera_installlees
VALUES
(1,"caméra cuisine",1,'on','2m','2019-04-18 10:00:00','2019-12-26 23:00:00'),
(2,'caméra salon',2,'on','3m','2019-04-03 10:00:00','2019-12-27 23:00:00'),
(3,'caméra cuisine',4,'on','2m','2019-05-15 10:00:00','2019-12-31 23:00:00'),
(4,'caméra salon',5,'off','2m','2019-06-12 10:00:00','2019-12-30 23:00:00'),
(5,'caméra salle à manger',6,'on','3m','2019-04-11 10:00:00','2019-12-26 23:00:00'),
(6,'caméra atelier',10,'off','4m','2019-04-08 10.00.00','2019-12-25 23.00.00');

INSERT INTO photo
VALUES
(1,1,'2019-11-25 01:46:09',"bureau/image/camera_image"),
(2,1,'2019-11-25 02:46:09',"bureau/image/camera_image"),
(3,1,'2019-11-25 03:46:09',"bureau/image/camera_image"),
(4,1,'2019-11-25 04:46:09',"bureau/image/camera_image"),
(5,2,'2019-11-25 06:46:09',"bureau/image/camera_image"),
(6,2,'2019-11-25 07:46:09',"bureau/image/camera_image"),
(7,2,'2019-11-25 08:46:09',"bureau/image/camera_image"),
(8,2,'2019-11-25 09:46:09',"bureau/image/camera_image"),
(9,3,'2019-11-25 10:46:09',"bureau/image/image_camera/camera_image"),
(10,3,'2019-11-25 11:46:09',"bureau/image/image_camera/camera_image"),
(11,3,'2019-11-25 12:46:09',"bureau/image/image_camera/camera_image"),
(12,3,'2019-11-25 13:46:09',"bureau/image/image_camera/camera_image"),
(13,3,'2019-11-25 14:46:09',"bureau/image/image_camera/camera_image"),
(14,3,'2019-11-25 15:06:09',"bureau/image/image_camera/camera_image"),
(15,4,'2019-11-25 15:46:09',"bureau/image/image_camera/camera_image"),
(16,4,'2019-11-25 16:46:09',"bureau/image/image_camera/camera_image"),
(17,4,'2019-11-25 17:46:09',"bureau/image/image_camera/camera_image"),
(18,4,'2019-11-25 18:46:09',"bureau/image/image_camera/camera_image"),
(19,4,'2019-11-25 19:46:09',"bureau/image/image_camera/camera_image"),
(20,5,'2019-11-25 20:46:09',"bureau/image/image_camera/camera_image"),
(21,5,'2019-11-25 21:46:09',"bureau/image/image_camera/camera_image"),
(22,5,'2019-11-25 22:46:09',"bureau/image/image_camera/camera_image"),
(23,5,'2019-11-25 23:46:09',"bureau/image/image_camera/camera_image"),
(24,5,'2019-11-25 00:46:09',"bureau/image/image_camera/camera_image"),
(25,6,'2019-11-25 01:46:09',"bureau/image/image_camera/camera_image"),
(26,6,'2019-11-25 02:46:09',"bureau/image/image_camera/camera_image"),
(27,6,'2019-11-25 03:46:09',"bureau/image/image_camera/camera_image"),
(28,6,'2019-11-25 04:46:09',"bureau/image/image_camera/camera_image"),
(29,6,'2019-11-25 05:46:09',"bureau/image/image_camera/camera_image");

-- 12 
SELECT nom_utilisateur,mail_utilisateur,mdp_utilisateur
FROM utilisateurs	 
WHERE id_utilisateur = 1

-- 13
SELECT nom_de_piece,id_proprio,description_piece
FROM piece	
WHERE id_proprio = 1




-- 14
SELECT C.nom_logique,C.id_piece_capteur,C.status_capteur,C.temp_mini,C.temp_maxi,C.interval_capteur,P.id_piece
FROM capteur_temperature as C
LEFT JOIN piece as P
   on C.id_piece_capteur = P.id_piece
WHERE id_piece_capteur = 4
ORDER BY id_piece_capteur ASC



-- 15
SELECT D.id_piece_capteur,D.valeur_temp,D.date_heure_acquisition,C.nom_logique,P.nom_de_piece,P.id_piece,C.id_cap_temp
FROM donnees_temperature as D 
LEFT JOIN piece as P
   on D.id_piece_capteur = P.id_piece
LEFT JOIN capteur_temperature as C
    on D.id_piece_capteur = C.id_cap_temp
WHERE D.id_piece_capteur = 1
ORDER BY D.id_piece_capteur ASC


--- sans doublon
SELECT DISTINCT D.id_piece_capteur,D.valeur_temp,D.date_heure_acquisition,C.nom_logique,P.nom_de_piece,P.id_piece,C.id_cap_temp
FROM donnees_temperature as D 
LEFT JOIN piece as P
   on D.id_piece_capteur = P.id_piece
LEFT JOIN capteur_temperature as C
    on D.id_piece_capteur = C.id_cap_temp
WHERE D.id_piece_capteur = 3
ORDER BY D.id_piece_capteur ASC
-- 17
SELECT DISTINCT C.nom_logique,C.temp_mini,P.nom_de_piece,D.date_heure_acquisition,C.id_piece_capteur
FROM capteur_temperature as C 
LEFT JOIN piece as P 
     on C.id_piece_capteur = P.id_piece
LEFT JOIN donnees_temperature as D
	 on C.id_piece_capteur = D.id_piece_capteur 
WHERE C.id_piece_capteur = 1
ORDER BY C.temp_mini ASC
--18
SELECT DISTINCT P.nom_de_piece, P.id_piece, P.id_proprio, C.temp_mini, C.id_piece_capteur,D.date_heure_acquisition, D.id_piece_capteur
FROM piece as P 
LEFT JOIN capteur_temperature as C 
	on P.nom_de_piece = P.id_piece
    and P.id_piece = C.id_piece_capteur
LEFT JOIN donnees_temperature as D
	ON P.nom_de_piece = P.id_piece
    and P.id_proprio = D.id_piece_capteur
WHERE P.nom_de_piece = 'cuisine' 
order by C.temp_mini ASC

-- 19
SELECT A.nom_ampoule,A.couleur_lumiere,A.status_ampoule,A.id_piece_ampoule,P.id_piece
FROM ampoules_connectees as A	 
LEFT JOIN piece as P
     ON A.id_piece_ampoule = P.id_piece
WHERE A.id_ampoule_connectee = 1
ORDER BY nom_ampoule ASC

-- 22
SELECT nom_camera,id_piece_camera,status_camera,distance_min_detec,date_debut_surveillance,date_fin_surveillance
FROM camera_installlees	
WHERE nom_camera = 'caméra salle à manger'

--23
SELECT P.id_photo,P.id_camera,P.date_capture,P.chemin_image ,C.date_debut_surveillance,C.date_fin_surveillance,C.nom_camera
FROM photo as P	
LEFT JOIN camera_installlees as C
ON P.id_photo = C.id_camera
WHERE C.nom_camera = 'caméra cuisine' and P.date_capture BETWEEN '2019-10-25 01:00:00' and '2019-12-25 03:00:00'
-- 25
CREATE TABLE thermostats (
    id_piece_thermostats INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_thermostat VARCHAR(15),
    id_capteur_1 INT(5) UNSIGNED NOT NULL,
    id_capteur_2 INT(5) UNSIGNED NOT NULL,
    temp_cible VARCHAR(10),
    status_thermostat VARCHAR(10),
    PRIMARY KEY (id_piece_thermostats)
);
INSERT INTO thermostats
VALUES
(1,'thermostats cuisine 1',1,3,'10°C',"inactif"),
(2,'thermostats salon 1',5,6,'10°C',"chaud"),
(3,'thermostats salle à manger 1',7,8,'10°C',"froid"),
(4,'thermostats cuisine 2',10,11,'10°C',"froid"),
(5,'thermostats salon 2',12,13,'10°C',"inactif"),
(6,'thermostats salle à manger 2',14,15,'10°C',"chaud"),
(7,'thermostats chambre 1',16,17,'10°C',"froid"),
(8,'thermostats salière',18,19,'10°C',"chaud"),
(9,'thermostats chambre 2',20,21,'10°C',"inactif"),
(10,'thermostats atelier',22,23,'10°C',"froid");

-- * EXERCICE 26 – AFFICHER LE NOMBRE DE PHOTOS PRISES CAMERA SUR LES 10 DERNIERS JOURS *
SELECT A.id_camera,nom_camera, COUNT(A.date_capture) as nbr_photo
FROM
(SELECT C.id_camera, nom_camera, date_capture
FROM camera_installlees as C
LEFT JOIN photo as P
 ON C.id_camera=P.id_photo
WHERE date_capture <= '2019-11-16 00:00:00' AND date_capture >= NOW()
GROUP BY id_camera) as A
GROUP BY id_camera

-- 27

SET @temp_therm = (SELECT (AVG(id_capteur_1)+ AVG(id_capteur_2))/2 FROM thermostats);
SET @max = (SELECT (MAX(date_heure_acquisition))FROM donnees_temperature);
SELECT nom_thermostat, temp_cible, status_thermostat, @temp_therm, @max,valeur_temp
FROM thermostats as T
LEFT JOIN capteur_temperature as C
 ON T.nom_thermostat=C.nom_logique
LEFT JOIN donnees_temperature as D
 ON C.id_cap_temp=D.id_capteur_temp
WHERE temp_cible!=@temp_therm
ORDER BY valeur_temp

-- 28
SET @test = ((SELECT AVG(valeur_temp) 
	FROM donnees_temperature
LEFT JOIN capteur_temperature 
	ON donnees_temperature.id_capteur_temp = capteur_temperature.id_cap_temp
RIGHT JOIN thermostats 
	ON capteur_temperature.id_cap_temp = thermostats.id_piece_thermostats
WHERE id_capteur_1
	AND valeur_temp IS NOT NULL 
	AND id_capteur_temp = 1) + (SELECT AVG(valeur_temp) 
	FROM donnees_temperature 
LEFT JOIN capteur_temperature 
	ON donnees_temperature.id_capteur_temp = capteur_temperature.id_cap_temp
RIGHT JOIN thermostats 
	ON capteur_temperature.id_cap_temp = thermostats.id_piece_thermostats
	WHERE id_capteur_2))/2;
SELECT id_piece_thermostats, nom_thermostat, temp_cible, @test,
(@test - ((SELECT AVG(valeur_temp) 
	FROM donnees_temperature as D 
LEFT JOIN capteur_temperature as S 
	ON D.id_capteur_temp = S.id_cap_temp
RIGHT JOIN thermostats as T 
	ON S.id_cap_temp = T.id_piece_thermostats 
WHERE T.id_capteur_1 = S.id_cap_temp
		AND D.id_capteur_temp IS NOT NULL) + (SELECT AVG(valeur_temp) 
	FROM donnees_temperature as D 
LEFT JOIN capteur_temperature as S 
	ON D.id_capteur_temp = S.id_cap_temp 
WHERE T.id_capteur_2 =S.id_cap_temp))/2) as diff10
	FROM thermostats as T
LEFT JOIN capteur_temperature as S
	ON T.nom_thermostat = S.nom_logique
LEFT JOIN donnees_temperature as D
 	ON S.id_cap_temp = D.id_capteur_temp
 WHERE id_piece_thermostats != 1;


-- * EXERCICE 29 – AFFICHER TEMPERATURE MOYENNE PAR PIECE PAR JOUR SUR LES 7 DERNIERS JOURS *
SELECT id_piece, nom_de_piece , COUNT(id_cap_temp) as nbr_capteur, AVG(valeur_temp) as temp_moy
FROM piece as P
LEFT JOIN capteur_temperature as C
ON C.id_piece_capteur = P.id_piece
LEFT JOIN donnees_temperature as D
ON D.id_capteur_temp = C.id_cap_temp
WHERE date_heure_acquisition <= DATE_ADD(NOW(), INTERVAL -7 DAY)
GROUP BY id_piece

-- 30 fait
SELECT nom_aliment,date_peremption,DATEDIFF(date_peremption,NOW()) as lim
FROM aliments	
ORDER BY lim ASC


 -- 31
ALTER TABLE aliments
ADD date_ouverture datetime
UPDATE `aliments` SET `date_ouverture` = '2019-11-19 12:00:00'

SELECT nom_aliment, date_peremption, date_ouverture, TIMEDIFF(date_peremption, date_ouverture) as temps_restant
FROM aliments
WHERE DATEDIFF(date_peremption, date_ouverture)<='02-00-00 00:00:00' AND TIMEDIFF(date_peremption, date_ouverture) <= '48:00:00'
ORDER BY TIMEDIFF(date_peremption, date_ouverture) ASC


-- 33
SELECT P.nom_de_piece, C.nom_camera, C.date_debut_surveillance, C.date_fin_surveillance, A.id_camera, COUNT(id_photo) as photo, AVG(id_photo) as moypoto
FROM photo as A 	
LEFT JOIN piece as P 
LEFT JOIN camera_installlees as C
       on A.id_camera = C.id_camera
WHERE C.date_debut_surveillance BETWEEN C.date_fin_surveillance and C.date_debut_surveillance and P.nom_de_piece = 'cuisine' and A.id_camera = '1'
ORDER BY P.nom_de_piece ASCc