CREATE DATABASE IF NOT EXISTS Projet_4 CHARACTER SET "utf8";
USE Projet_4;
CREATE USER 'Théo'@'10.41.30.87' IDENTIFIED BY '123';
CREATE USER 'Julien'@'10.138.33.154' IDENTIFIED BY '456';
GRANT ALL PRIVILEGES ON * . * TO 'Théo'@'10.41.30.87';
GRANT ALL PRIVILEGES ON * . * TO 'Julien'@'10.138.33.154';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    	nom_utilisateur varchar(20),
    	prenom_utilisateur varchar(20),
    	adresse_mail_utilisateur varchar(30),
    	telephone_utilisateur varchar(15),
    	adresse_utilisateur varchar(40),
    	code_postal_utilisateur varchar(7),
     	type_utilisateur varchar(10),
    	mot_de_passe varchar(25),
    PRIMARY KEY(id)
    );
   ALTER TABLE utilisateurs ENGINE=INNODB

CREATE TABLE IF NOT EXISTS piece (
   		id_piece INT UNSIGNED NOT NULL AUTO_INCREMENT,
    	nom_de_piece varchar(20),
    	id_utilisateur_proprio varchar(20),
    	description_piece varchar(255),
       PRIMARY KEY (id_piece)
    )
    ALTER TABLE piece ENGINE=INNODB


    CREATE TABLE ampoule_connecter (
    id_ampoule_connecter int unsigned 	AUTO_INCREMENT,
    id_logement_ampoule INT,
    id_piece_ampoule int unsigned,
    nom_ampoule varchar (30),
    status_ampoule varchar(10),
    couleur_lumiere varchar(30),
    heure_allumage varchar (5),
    PRIMARY KEY (id_ampoule_connecter)
    )
    ALTER TABLE ampoule_connecter ENGINE=INNODB
    
    CREATE TABLE donnees_ampoules (
         id_ampoule INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
          action_ampoule VARCHAR (10) NOT NULL,
         date_action DATETIME,
   PRIMARY KEY (id_ampoule)
    )
    
        ALTER TABLE donnees_ampoules ENGINE=INNODB

  CREATE TABLE camera_installlees (
    id_camera INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nom_camera VARCHAR (30),
    id_piece_camera INT(5) UNSIGNED,
    status_camera VARCHAR(3),
    distance_min_detec VARCHAR(10),
    date_debut_surveillance DATETIME,
    date_fin_surveillance DATETIME,
    PRIMARY KEY (id_camera)
    )
    )
    ALTER TABLE camera_logement ENGINE=INNODB
   
    CREATE table capteur_temperature (
        id_cap_temp int unsigned not null AUTO_INCREMENT,
        id_temp_logement int,
        nom_logique varchar (30),
        id_piece_capteur int,
        status_capteur varchar(3),
        interval_capteur varchar (20),
        temp_mini varchar (10),
        temp_maxi varchar (10),
    PRIMARY KEY (id_cap_temp)
);
ALTER TABLE capteur_temperature ENGINE=INNODB

CREATE TABLE donnees_temperature (
   id_capteur_temp INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
   valeur_temp VARCHAR(5),
   date_heure_acquisition DATETIME,
   PRIMARY KEY (id_capteur_temp)
);
ALTER TABLE donnees_temperature ENGINE=INNODB

CREATE TABLE thermostats (
   id_piece_thermostats INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
   nom_thermostat VARCHAR(15),
   id_capteur_1 INT(5) UNSIGNED NOT NULL,
   id_capteur_2 INT(5) UNSIGNED NOT NULL,
   temp_cible VARCHAR(10),
   status_thermostat VARCHAR(10),
   PRIMARY KEY (id_piece_thermostats)
);
ALTER TABLE thermostats ENGINE=INNODB

CREATE TABLE photo (
   id_camera INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
   date_capture DATETIME,
   chemin_image VARCHAR(40),
   PRIMARY KEY (id_camera)
);
ALTER TABLE photo ENGINE=INNODB

CREATE TABLE aliments (
   id_piece_aliment INT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
   nom_aliment VARCHAR(20),
   date_peremption VARCHAR(12),
   quantite_aliment INT(10),
   PRIMARY KEY (id_piece_aliment)
);
ALTER TABLE aliments ENGINE=INNODB

INSERT INTO piece (nom_de_piece,id_utilisateur_proprio,description_piece)
VALUES ('chambre','1',"c'est la piece a dormir"),
       ('toilette','1',"c'est le trone"),
       ('salle de bain','1',"la piece pour etre propre")
        ('chambre','2',"c'est la piece a dormir"),
       ('toilette','2',"c'est le trone"),
       ('salle de bain','2',"la piece pour etre propre"),
       ('chambre','2',"c'est la piece a dormir"),
       ('couloir','2',"la piece qui fait peur"),
       ('chambre2','2',"une autre chambre"),
       ("salle de sport","2","la salle pour plaire au fille")

       ALTER TABLE `aliments` ADD `id_aliment` INT NOT NULL AFTER `quantite_aliment`;

       INSERT INTO aliments
        VALUES
    (1,1,"fromage","11/04/2020",10),
(2,1,"fraise","25/03/2020",4),
(3,1,"pomme","16/04/2019",9),
(4,1,"yaourt","20/11/2020",8),
(5,1,"poire","14/04/2019",7),
(6,1,"steak","18/09/2020",6),
(7,1,"oasis","24/05/2020",6),
(8,1,"olives","31/04/2020",30),
(9,1,"salade","01/01/2019",1),
(10,1,"poulet","26/12/2020",2),
(11,2,"pomme de terre","17/03/2020",20),
(12,2,"compote","19/02/2020",9),
(13,2,"biscuit","11/01/2020",7),
(14,2,"bonbon","10/06/2021",5),
(15,2,"pain","09/10/2019",3),
(16,2,"riz","27/05/2020",5),
(17,2,"courgette","15/09/2020",4),
(18,2,"pizza","28/11/2019",3),
(19,2,"burger","20/07/2020",18),
(20,2,"avocat","30/08/2020",12),
(21,2,"merguez","02/11/2020",10),
(22,2,"nouille","12/04/2020",4),
(23,2,"jus d'orange","07/04/2020",3),
(24,2,"pate","11/12/2021",2),
(25,2,"tomate","13/05/2020",4);

INSERT INTO utilisateurs
VALUES 
(1, "Bastide", "Anis","0676537592","76 rue des courlis","95100","anisbastide@gmail.com","azerty25565","normal"),
(2, "Pelerin", "Axel","0784532818","8 avenue porte de champerret","75017","axelpelerin@gmail.com","alerjce1001","normal"),
(3, "Lai", "Jimmy","0643821193","8 avenue porte de champerret","75017","jimmylai@gmail.com","ejfhz6ghej1","normal"),
(4, "Tran-Tao", "Arthur","0725647201","76 rue des courlis","95100","arthurtrantao@gmail.com","wscfbhnjue","normal"),
(5, "Viseux", "Julien","0781585528","76 rue des courlis","95100","julienviseux@gmail.com","poiuytre25565","admin"),
(6, "Moutty", "Théo","0672980028","8 avenue porte de champerret","75017","theomoutty@gmail.com","plijygrdes","admin")

ALTER TABLE `capteur_temperature` CHANGE `id_temp_logement` `id_temp_logement` INT(11) NULL DEFAULT NULL;



INSERT INTO capteur_temperature (nom_logique,id_temp_logement,id_piece_capteur,status_capteur,interval_capteur,temp_mini,temp_maxi) 
VALUES ('capteur temperature',1,1,'off','10s','-30°','+80°')
        ('capteur temperature',1,2,'off','10s','-30°','+80°')
        ('capteur temperature',1,3,'off','10s','-30°','+80°')
         ("capteur d'humidite",2,1,'on','10s','-30%','+100%')
         ("capteur d'humidite",2,2,'on','10s','-30%','+100%')
         


INSERT INTO capteur_temperature (id_temp_logement,id_piece_capteur ,nom_logique ,status_capteur ,interval_capteur,temp_mini,temp_maxi)
VALUES	(1,1,'capteur de temperature','on','10s','-30','+80'),
		(1,1,'capteur de temperature','off','10s','-30','+80'),
        (1,1,'capteur de temperature','off','10s','-30','+80'),
        (1,2,'capteur de temperature','on','10s','-30','+80'),
        (1,2,'capteur de temperature','on','10s','-30','+80'),
        (1,2,'capteur de temperature','off','10s','-30','+80'),
        (1,3,'capteur de temperature','on','10s','-30','+80'),
        (1,3,'capteur de temperature','off','10s','-30','+80'),
        (1,3,'capteur de temperature','on','10s','-30','+80'),
        (1,4,'capteur de temperature','off','10s','-30','+80'),
        (1,4,'capteur de temperature','off','10s','-30','+80'),
        (1,4,'capteur de temperature','off','10s','-30','+80'),
        (2,1,'capteur de temperature','on','10s','-30','+80'),
        (2,1,'capteur de temperature','off','10s','-30','+80'),
        (2,2,'capteur de temperature','on','10s','-30','+80'),
        (2,2,'capteur de temperature','off','10s','-30','+80'),
        (2,3,'capteur de temperature','on','10s','-30','+80'),
        (2,3,'capteur de temperature','on','10s','-30','+80'),
        (2,4,'capteur de temperature','off','10s','-30','+80'),
        (2,4,'capteur de temperature','on','10s','-30','+80'),
        (2,5,'capteur de temperature','on','10s','-30','+80'),
        (2,5,'capteur de temperature','on','10s','-30','+80'),
        (2,6,'capteur de temperature','on','10s','-30','+80')
        

INSERT INTO ampoule_connecter(id_logement_ampoule,id_piece_ampoule,nom_ampoule,status_ampoule,couleur_lumiere,heure_allumage)
VALUES (1,1,'ampoule led','on','blanche','6h'),
        (1,2,'ampoule led','on','Rose','10h'),
        (1,3,'ampoule led','on','bleu','7h'),
        (1,4,'ampoule led','on','blanche','6h'),
        (1,5,'ampoule led','on','blanche','6h'),
        (2,1,'ampoule led','on','vert','10h'),
        (2,2,'ampoule led','on','jaune','19h'),
        (2,3,'ampoule led','on','violet','8h'),
        (2,4,'ampoule led','on','bleu','6h30')

INSERT INTO `donnees_ampoules`(`id_logement_ampoule_donne`, `ampoule_par_piece`, `action_ampoule`, `date_action`) 
VALUES (1,1,'allumer','2019-11-25 15:46:09')
       (1,1,'allumer','2019-11-25 15:46:09'),
		 (1,1,'eteint','2019-11-25 16:15:09'),
        (1,2,'allumer','2019-11-25 16:46:09'),
        (1,2,'eteint','2019-11-25 17:46:09'),
        (1,2,'allumer','2019-11-25 18:30:09'),
        (1,3,'eteint','2019-11-25 12:46:09'),
        (1,3,'allumer','2019-11-25 13:36:09'),
        (1,3,'eteint','2019-11-25 19:06:09'),
        (1,4,'eteint','2019-11-25 00:46:09'),
        (1,4,'allumer','2019-11-25 01:46:09'),
        (1,4,'eteint','2019-11-25 05:00:09'),
        (1,5,'allumer','2019-11-25 09:30:00'),
        (1,5,'eteint','2019-11-25 10:30:00'),
        (1,5,'allumer','2019-11-25 16:40:00'),
        (2,1,'eteint','2019-11-25 06:00:00'),
        (2,1,'allumer','2019-11-25 06:30:00'),
        (2,1,'eteint','2019-11-25 07:46:09'),
        (2,1,'allumer','2019-11-25 16:46:09'),
        (2,2,'eteint','2019-11-25 10:26:09'),
        (2,2,'allumer','2019-11-25 14:46:09'),
        (2,2,'allumer','2019-11-25 14:56:09'),
        (2,2,'eteint','2019-11-25 15:46:09'),
        (2,3,'allumer','2019-11-25 16:00:09'),
        (2,3,'eteint','2019-11-25 16:46:09'),
        (2,3,'allumer','2019-11-25 17:26:09'),
        (2,3,'eteint','2019-11-25 11:46:09'),
        (2,4,'allumer','2019-11-25 13:46:09'),
        (2,4,'eteint','2019-11-25 14:46:09'),
        (2,4,'allumer','2019-11-25 15:46:09'),
        (2,4,'eteint','2019-11-25 19:46:09')

       INSERT INTO `photo`(`date_capture`, `chemin_image`, `id_photo_logement`, `id_camera_par_piece`) 
      VALUES ('2019-11-25 01:46:09',"bureau/image/camera_image",1,1),
		   ('2019-11-25 02:46:09',"bureau/image/camera_image",1,1),
        ('2019-11-25 03:46:09',"bureau/image/camera_image",1,1),
        ('2019-11-25 04:46:09',"bureau/image/camera_image",1,1),
        ('2019-11-25 05:46:09',"bureau/image/camera_image",1,2),
        ('2019-11-25 06:46:09',"bureau/image/camera_image",1,2),
        ('2019-11-25 07:46:09',"bureau/image/camera_image",1,2),
        ('2019-11-25 08:46:09',"bureau/image/camera_image",1,2),
        ('2019-11-25 09:46:09',"bureau/image/image_camera/camera_image",2,1),
        ('2019-11-25 10:46:09',"bureau/image/image_camera/camera_image",2,1),
        ('2019-11-25 11:46:09',"bureau/image/image_camera/camera_image",2,1),
        ('2019-11-25 12:46:09',"bureau/image/image_camera/camera_image",2,1),
        ('2019-11-25 13:46:09',"bureau/image/image_camera/camera_image",2,1),
        ('2019-11-25 14:46:09',"bureau/image/image_camera/camera_image",2,2),
        ('2019-11-25 15:46:09',"bureau/image/image_camera/camera_image",2,2),
        ('2019-11-25 16:46:09',"bureau/image/image_camera/camera_image",2,2),
        ('2019-11-25 17:46:09',"bureau/image/image_camera/camera_image",2,2),
        ('2019-11-25 18:46:09',"bureau/image/image_camera/camera_image",2,2),
        ('2019-11-25 19:46:09',"bureau/image/image_camera/camera_image",2,3),
        ('2019-11-25 20:46:09',"bureau/image/image_camera/camera_image",2,3),
        ('2019-11-25 21:46:09',"bureau/image/image_camera/camera_image",2,3),
        ('2019-11-25 22:46:09',"bureau/image/image_camera/camera_image",2,3),
        ('2019-11-25 23:46:09',"bureau/image/image_camera/camera_image",2,3),
        ('2019-11-25 00:46:09',"bureau/image/image_camera/camera_image",2,4),
        ('2019-11-25 01:46:09',"bureau/image/image_camera/camera_image",2,4),
        ('2019-11-25 02:46:09',"bureau/image/image_camera/camera_image",2,4),
        ('2019-11-25 03:46:09',"bureau/image/image_camera/camera_image",2,4),
        ('2019-11-25 04:46:09',"bureau/image/image_camera/camera_image",2,4)


        INSERT INTO camera_installlees
VALUES
(1,"caméra cuisine",1,'on','2m','2019-04-18 10:00:00','2019-12-26 23:00:00'),
(2,'caméra salon',2,'on','3m','2019-04-03 10:00:00','2019-12-27 23:00:00'),
(3,'caméra cuisine',4,'on','2m','2019-05-15 10:00:00','2019-12-31 23:00:00'),
(4,'caméra salon',5,'off','2m','2019-06-12 10:00:00','2019-12-30 23:00:00'),
(5,'caméra salle à manger',6,'on','3m','2019-04-11 10:00:00','2019-12-26 23:00:00'),
(6,'caméra atelier',10,'off','4m','2019-04-08 10.00.00','2019-12-25 23.00.00');


CREATE TABLE donnees_temperature (
    id_capteur_temp INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    valeur_temp VARCHAR(5),
    date_heure_acquisition DATETIME,
    PRIMARY KEY (id_capteur_temp)
);


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


ALTER TABLE piece 
ADD FOREIGN KEY (id_piece) REFERENCES utilisateur(id) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE aliments
ADD FOREIGN KEY (id_piece_aliment) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE capteur_temperature
ADD FOREIGN KEY (id_cap_temp) REFERENCES donnees_temperature(id_capteur_temp) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE thermostats
ADD FOREIGN KEY (id_piece_thermostats) REFERENCES donnees_temperature(id_capteur_temp) piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE thermostats
ADD FOREIGN KEY (id_piece_thermostats) REFERENCES capteur_temperature(id_cap_temp) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE thermostats
ADD FOREIGN KEY (id_piece_thermostats) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE


ALTER TABLE ampoule_connecter
ADD FOREIGN KEY (id_ampoule_connecter) REFERENCES donnees_ampoules(id_ampoule) ON DELETE CASCADE ON UPDATE CASCADE


ALTER TABLE camera_logement
ADD FOREIGN KEY (id_camera) REFERENCES photo(id_camera) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE capteur_temperature
ADD FOREIGN KEY (id_cap_temp) REFERENCES piece(id_piece) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE piece 
ADD FOREIGN KEY (id_piece) REFERENCES capteur_temperature(id_cap_temp) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE piece 
ADD FOREIGN KEY (id_piece) REFERENCES camera_logement(id_camera) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE piece 
ADD FOREIGN KEY (id_piece) REFERENCES ampoule_connecter(id_ampoule_connecter) ON DELETE CASCADE ON UPDATE CASCADE


