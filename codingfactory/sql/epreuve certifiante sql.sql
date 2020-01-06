
-- exo 1

-- inodb et myisam sont des moteur de stokage pour le sql les deux sont different et on chaqu'un leur inconveniant comme leur avantage
-- inob et utiliser comme il supporte les cle etrangere et gere les transactions qui sont des ensemble de requette regroupe alors il est à privilégier 
-- pour les systèmes qui ne doivent pas comporter d’erreurs et qui nécessite des clés étrangères. Pour une application gérant des données importantes.

-- myIsam est très rapide pour effectuer des SELECT ou des INSERT, il est pas de transactions pas de clés étrangères
-- donc il est pas a utiliser quand on as pas besoin de cle etrangere et de transactionsPas de transactions


-- exo 2

-- une requete correlee est une sous requete qui fait refferance a une colonne pas encore donne ou preciser dans la requete

-- exo 3
-- union sert de rassambler les résultats de plusieurs requêtes utilisant elles-même la commande SELECT 
-- union ne fait pas de doublons
-- union all met les doublons 

-- exo 4

-- une cle etrangere permet de lier une colonne d'un tableau a une autre colonne d'un autre tableau 

-- exo 5

-- pour stocker un moment ou une date, on utilise datetime


-- requete
-- exo 1

-- exo 2

SELECT nom, prenom , timestampdiff(YEAR, date_naissance, now()) as age
    FROM joueurs	 
where date_naissance <= now()
ORDER by nom asc

-- exo 3

SELECT timestampdiff(year, min(date_naissance), max(date_naissance) ) as annee
    FROM joueurs

-- exo 4

SELECT distinct a.nom
    FROM  assoc_j_e
left join equipes as a
	on a.id = id_equipe
WHERE id_equipe > 4

-- exo 5

INSERT into joueurs
        VALUES (29,'Spielberg','Steven','1999-3-5','186','gardien')  


INSERT into assoc_j_e
    VALUES (29,29,1,'2017-4-6')

-- exo 6

SELECT z.nom, z.prenom, n.nom
FROM joueurs as z
left join assoc_j_n as b
	on b.id_joueur = z.id 
left join nationalite as n
	on n.id = b.id_nationalite
LEFT join assoc_j_c as c
	on c.id_joueur = z.id
left join rencontres as r
		on c.id_rencontre = r.equipe_exterieur
        and  c.id_rencontre = r.equipe_domicile
WHERE z.poste = 'Attaque' and c.id_carton >= 1 or r.date_match >= '2018-1-1';

-- exo 7

SELECT DISTINCT A.nom
    FROM nationalite as A	 
left join assoc_j_n as n
	on A.id = n.id_nationalite
WHERE n.id_joueur and n.id_nationalite

-- exo 8

UPDATE joueurs
    set date_naissance = '1998-2-6'
where id = 29

-- exo 9 

SELECT j.id, j.nom , j.prenom, count(c.id_carton) as nomcarton, count(b.id_joueur) as but, LENGTH(nom) as longeur_nom
    FROM joueurs as j 	
left join assoc_j_c as c
	on j.id = c.id_joueur
left join buts as b
	on j.id = b.id_joueur
WHERE nom like ('%p%')
    GROUP BY j.id
ORDER by nom asc

-- exo 10
SELECT COUNT(n.nom) as nb_nationalite, COUNT(j.id) as nb_joueur, COUNT(e.id) as nb_equipe , count(c.id_carton) as nb_carton, sum(e.budget)
    FROM nationalite as n
left join joueurs as j 
	on n.id = j.id
LEFT join equipes as e
	on n.id = e.id
LEFT join assoc_j_c as c
	on n.id = c.id

-- exo 15

SELECT COUNT(j.id)
    from joueurs as j
left join assoc_j_n as n
	on j.id = n.id_joueur
left join nationalite as t 
	on n.id_nationalite = t.id
where t.nom = 'Allemagne'


-- exo 18

SELECT id 
    FROM joueurs
where id BETWEEN 3 and 10

-- exo 17

SELECT nom, prenom 
    FROM joueurs	 
where timestampdiff(YEAR, date_naissance, now()) > 23
ORDER by nom asc

-- exo 19

SELECT j.nom, count(b.id_joueur) as total_butmarque, AVG(b.id_joueur) as moybut
    FROM joueurs as j
LEFT join buts as b
	on j.id = b.id_joueur
GROUP BY j.id


-- exo 21

DELETE
    FROM joueurs
WHERE id = 29

-- exo 20

alter table rencontres
    ADD FOREIGN KEY (equipe_exterieur) REFERENCES equipes(id) on delete cascade on update cascade

--- 14
SELECT j.nom, j.prenom, j.id, a.nom 
FROM joueurs as j
left join assoc_j_e as e
	on j.id = e.id_joueur
LEFT join equipes as a
	on e.id_equipe = a.id
WHERE a.nom = 'PSG'