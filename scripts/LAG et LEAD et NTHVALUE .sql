/*******************************************************************************
***************************** LAG/LEAD    **************************************
********************************************************************************/

--LAG :Accède aux données d’une ligne précédente dans le même jeu de résultats 
--LEAD : Accède aux données à partir d’une ligne ultérieure dans le même jeu de résultats

-- continuons sur la table Product

select * from products

-- Commencons par le LAG :

select product_id, product_name,price, lag(price,1,0) over (order by product_id) as resultat_precedent from products

-- On peut voir la valeur precedente dans la colonne 

-- Et si je veux faire un saut de 2 ?

select product_id, product_name,price, lag(price,2,0) over ( order by product_id) as resultat_precedent from products

-- Et le LEAD

select product_id, product_name,price, lead(price,1,0) over ( order by product_id) as resultat_ulterieure from products

-- On peut voir la valeur ulterieure dans la colonne 

-- Idem on peut faire un saut de 2 

select product_id, product_name,price, lead(price,2,0) over ( order by product_id) as resultat_ulterieure from products

/*******************************************************************************
*************               NTH _VALUE    ************************************
********************************************************************************/

-- Toujours le meme SELECT :

CREATE TABLE produit ( product_id INTEGER,product_name VARCHAR (250), price INT)

INSERT INTO produit VALUES 
(1,'Microsoftlumia',200),-- doublon
(1,'Microsoftlumia',400),
(1,'Microsoftlumia',800),
(2,'HTC ONE',400),
(3,'Nexus',500),
(4,'iphone',900),
(5,'HPElite',1200),
(6,'Lenovo Thinkpad',700),
(7,'Sony VAIO',700),
(8,'Dell Vostro',800),
(9,'Ipad',700),
(10,'Kindle fire',150),
(10,'Kindle fire',300),
(10,'Kindle fire',600),
(11,'Samsung galaxy Tab',200)

select * from produit

-- Question : Comment je fais pour avoir une colonne avec le 2eme prix le plus cher ?

SELECT 
    product_id,
    product_name,
    price,
    NTH_VALUE(product_name, 2) 
    OVER(ORDER BY price desc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM produit

-- La clause frame définit le début du cadre à la ligne de début et la fin à la ligne de fin de l'ensemble de résultats.