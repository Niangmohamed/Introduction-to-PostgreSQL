/******************************************************************************
********************************   LIKE ***************************************
*******************************************************************************/

-- Que donne le SELECT 

select * from contact

-- le like peut fonctionner comme un WHERE 

SELECT nom
FROM Contact 
WHERE nom  ='Marchand'

SELECT nom
FROM Contact 
WHERE nom  like 'Marchand'

-- Meme resultat...


-- Si je veux tous les noms ou il y a la lettre V dedans ?

SELECT nom
FROM Contact 
WHERE nom LIKE '%V%'

-- Si je veux tous les prenoms ou il y a la lettre N dedans ?
SELECT prenom
FROM Contact 
WHERE prenom LIKE '%n%'


--- Si je veux toutes les dates de naissance ou il y a un 08  ? 

SELECT *
FROM Contact 
WHERE date_de_naissance::text  like '%08%'

-- Trouvez les prénoms qui finissent par e

SELECT prenom
FROM Contact 
WHERE prenom LIKE '%e'

-- Trouvez les prénoms qui a un a en 2eme position et qui finit par e

SELECT prenom
FROM Contact 
WHERE prenom LIKE '_a%e'


--- Si je veux tous ages qui commencent par 2 ? 

SELECT *
FROM Contact 
WHERE age like '2%'

-- Ca se gate quand je passe par des entiers...

-- Il faut rajouter 
SELECT *
FROM Contact 
WHERE age::text like '2%'


--- Et pour la sensiblité a la casse ? 

-- Avec cette requete 

select * from contact where nom ='Marchand'

--Et la  ?

select * from contact where nom ='marchand'

-- Probleme sur la sensibilité a la casse apparement, ce qui peut etre parfois tres embetant

select * from contact where nom ilike 'marchand'

-- I pour insensitive mais qui peut etre tres coutuex en performance

-- Sinon on peut mettre LOWER

select * from contact where lower(nom) ='marchand'