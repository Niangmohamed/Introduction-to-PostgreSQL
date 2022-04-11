/******************************************************************************
********************************   MIN MAX AVG ********************************
*******************************************************************************/
-- Que me donne le select avec un order by 

select * from contact order by age asc

--Si je veux selectionner l'age minimum dans la colonne age

select  min(age) from contact 

--Si je veux selectionner l'age maximum  dans la colonne age

select  max(age) from contact 

--Si je veux selectionner l'age moyen  dans la colonne age

select  avg(age) from contact 

--Si je veux selectionner l'age minimum des gens qui sont nés en 1976 ? 

select  min(age) from contact where year(date_de_naissance) =1976

--Verifions par nous meme :

select  * from contact where year(date_de_naissance) =1976

-- une demande un peu farfelue :
-- Je veux le max de l'age de toutes les personnes qui commencent par la lettre E ?

select max(age) from contact where prenom like 'E%'

-- Verifions par nous meme :

select * from contact where prenom like 'E%'

--Peut on appliquer ca a une colonne ou il y a des caracteres comme la colonne nom par exemple

select  max(nom) from contact 

-- Verifions par nous meme

select * from contact order by nom asc

-- Il prend la derniere lettre par ordre alphabétique donc le V

-- Et le Min ? 

select  min(nom) from contact 

-- Il prend la premiere lettre par ordre alphabétique donc le B