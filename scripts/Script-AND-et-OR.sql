/******************************************************************************
********************************   AND et OR **********************************
*******************************************************************************/
--L’opérateur AND permet de joindre plusieurs conditions dans une requête.
--Il s’applique au filtre WHERE.
-- La Clause AND requiert que les deux conditions soient remplies pour retourner la requête.

-- La Clause OR requiert qu’une condition soit remplie pour retourner la requête.
--Il s’applique aussi au filtre WHERE.


--Que me donne le SELECT ? 

select  * from contact

--Si je veux selectionner les hommes qui ont moins de 41 ans

select  * from contact where sexe='M' and age < 41

-- Idem je veux les personnes qui sont nées au mois d'aout et qui sont agés de plus de 16 ans

select * from contact where date_de_naissance::text  like  '%08%' and age > '16'

--La Clause AND requiert que les deux conditions soient remplis pour retourner la requête

--- Prenons la même requete et mettons un âge qui n'est pas bon genre 101 

select * from contact where date_de_naissance::text  like  '%08%' and age =101

-- cela ne retourne rien car l'une des conditions n'a pas été rempli, pourtant
-- il y a bien des gens qui sont nés au mois d'aout

select * from contact where date_de_naissance::text  like  '%08%'

-- Le OR requiert qu'une condition soit remplie
 
-- Si on joue la meme requete mais en le remplacant par le OR 

select * from contact where date_de_naissance::text  like  '%08%' or age =101

-- Il me sort que les personnes qui sont nées au mois d'aout Bingo !!!

-- Et si je prends les personnes qui sont nés au mois d'aout ou qui ont l'age de 16 ans ?

select * from contact where date_de_naissance::text  like  '%08%'  or age > 16

--C'est interessant car la requete m'a sorti : 

-- Les personnes qui sont nés au mois d'aout et aussi tout ceux qui ont plus de 16 ans.
-- En fait les deux conditions ont été réunis dont il a cumulé les deux resultats ensemble
-- car il a pris aussi les personnes qui ne sont pas nés au mois d'aout...



-- Si je veux le nom Dutruel et Virenque dans la même requete ? 

select * from contact where nom ='Portail' and nom ='Virenque'

-- ca ne donne rien, car le AND ne peut pas s'appliquer sur la même colonne 
-- on partira alors sur le OR 

select * from contact where nom ='Portail' or nom ='Virenque'

--La on est bon
-- et si j'applique le OR sur la meme requete que celle un peu plus haut 
