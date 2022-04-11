/******************************************************************************
********************************  COUNT et SUM ********************************
*******************************************************************************/
--Comptez moi le nombre de lignes dans la table contact ? 

select  count(*) from contact 

-- Est ce bon ?

select * from contact

-- l'etoile prend toutes les colonnes de la table

-- Et si je mets le nom d'une colonne dans le count

select count(nom) from contact 

-- Pourquoi ne pas compter les lignes qui n'ont pas de valeurs nuls ?
-- On veut enlever la valeur NULL de Mme bourgeon

select * from contact

-- donc cela donnera 

select count(*) from contact where date_de_naissance is not null

-- On en a bien 15 

-- On peut aussi rajouter un DISTINCT au COUNT 
-- Je veux compter le nombre de personne qui n'ont pas le meme prenom

select * from contact order by prenom asc

-- il n'y a que olivier,ludivine et pascal  en doublon donc logiquement cela me retournera 13
-- car 16 -3 doublons =13

select count(distinct prenom) from contact

-- Le compte est bon

-- puis je faire la meme chose avec le SUM ? SUM(*) marche t il ? 

select  sum(*) from contact 

-- et sur la colonne Nom ? 

select  sum(nom) from contact

-- Le SUM ne s'applique que sur les colonnes de types numeriques

-- Et sur la colonne age ? 

select sum(age) from contact

-- Un petit SELECT pour mieux comprendre 

select age from contact

-- la j'ai le cumul de tous les ages de la colonne age

-- on peut aussi contourner ce probleme en mettant un SUM(1)

select sum(1) from contact

-- Si je mets 2 cela va me compter deux fois les lignes 

select sum(7) from contact

-- etc..

-- et si je veux l'age total des femmes? 

select sum(age) from contact where sexe='F'

/******************************************************************************
********************************  GROUP BY **************************************
*******************************************************************************/

select * from contact

--Comptez moi le nombre de personne qui sont de sexe masculin ?

select count(*) as Total from contact
where  sexe ='M'

--Comptez moi le nombre de personne qui sont de sexe masculin et qui sont nées en 1976?

select count(*)as Total ,sexe,date_de_naissance  from contact
where  sexe ='M' and date_de_naissance::text like '1976%'

--et si je rajoute le GROUP BY  ?

select count(*)as Total ,sexe,date_de_naissance as Total from contact
where  sexe ='M' and date_de_naissance::text like '1976%'
group by sexe,date_de_naissance

select count(*) as Total from contact
where  sexe ='M' and date_de_naissance::text like '1976%'


-- Verifions :

select * from contact where sexe ='M' and date_de_naissance::text like '1976%'



-- On doit mettre le GROUP BY pour regrouper les données et que la requete sorte..

