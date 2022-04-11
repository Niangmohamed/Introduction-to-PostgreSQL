/*******************************************************************************
********************** ROWS /RANGE UNBOUNDED PRECEDING     *********************
********************************************************************************/

-- UNBOUNDED PRECEDING, toutes les lignes avant la ligne actuelle
-- UNBOUNDED FOLLOWING, toutes les lignes apres la ligne actuelle
-- x PRECEDING  les lignes avant la ligne actuelle
-- y FOLLOWING les lignes apres les lignes actuelles

-- Pour mieux comprendre on va creer une nouvelle table pour mieux comprendre


CREATE TABLE salaire (group_id int, salaire INT );

INSERT INTO salaire VALUES 
(1,126),
(2,63),
(3,43),
(4,9),
(4,24),
(4,30),
(7,33),
(8,33),
(9,50),
(10,41),
(11,41),
(11,42)

select * from salaire

-- Partons pour la requete :

SELECT group_id,salaire
   ,SUM(Salaire) OVER (ORDER BY group_id ROWS UNBOUNDED PRECEDING) AS CumulativeSumByRows
   ,SUM(Salaire) OVER (ORDER BY group_id RANGE UNBOUNDED PRECEDING) AS CumulativeSumByRange
FROM salaire

/*******************************************************************************
***********************     FIRST et LASTE VALUES      ************************
********************************************************************************/

-- FIRST_VALUES : Retourne la première valeur dans un jeu de valeurs ordonné
-- LAST_VALUES : Retourne la derniere valeur dans un jeu de valeurs ordonné

-- Continuons sur la table products

SELECT group_id,salaire,
	FIRST_VALUE(salaire) OVER( partition by group_id ORDER BY group_id) AS FirstOrderTotal,
	LAST_VALUE(salaire) OVER( partition by group_id ORDER BY group_id) AS LastOrderTotal
FROM salaire; 



