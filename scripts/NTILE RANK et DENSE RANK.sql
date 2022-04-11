/*******************************************************************************
************** RANK/ DENSE RANK / NTILE   **************************************
********************************************************************************/
-- creation d'une table

CREATE TABLE ranks (
   c VARCHAR(10)
);

-- Insertion de valeur bidon 

INSERT INTO ranks(c)
VALUES('A'),('A'),('B'),('B'),('B'),('C'),('E');

-- Que donne le SELECT ? 

select * from ranks

-- Essayons le RANK 

SELECT c,
 row_number () over ( order  by c ),
 RANK () OVER (  ORDER BY c ) rank_number 
FROM ranks


--Les premières et deuxième lignes reçoivent le même rang car elles ont la même valeur A.
--Les troisième, quatrième et cinquième rangées reçoivent le rang 3 car la RANK()fonction saute le rang 2 et toutes ont les mêmes valeurs B.
-- On voit qu'il y a un saut de rang sur le RANK 

-- Et DENSE_RANK : 

SELECT c,
 row_number () over ( order  by c ),
 dense_RANK () OVER (  ORDER BY c ) as dense_number,
 RANK () OVER (  ORDER BY c ) rank_number 
FROM ranks

-- DENSE RANK ne fait pas le saut 
SELECT c,
 row_number () over ( order  by c ),
 dense_RANK () OVER (  ORDER BY c ) as dense_number,
 RANK () OVER (  ORDER BY c ) rank_number ,
 NTILE (4) OVER (  ORDER BY c ) as NTILES
FROM ranks

-- ET NTILE ? 

CREATE TABLE products ( product_id INTEGER,product_name VARCHAR (250), price INT)

INSERT INTO products VALUES 
(1,'Microsoftlumia',200),
(2,'HTC ONE',400),
(3,'Nexus',500),
(4,'iphone',900),
(5,'HPElite',1200),
(6,'Lenovo Thinkpad',700),
(7,'Sony VAIO',700),
(8,'Dell Vostro',800),
(9,'Ipad',700),
(10,'Kindle fire',150),
(11,'Samsung galaxy Tab',200)

-- Avec un SELECT 
SELECT  * ,NTILE (4) OVER (  ORDER BY price ) as NTILES
FROM products;

-- NTILE decoupe en plusieurs fragments la numérotation 
-- et avec 2 ?
SELECT  * ,NTILE (3) OVER (  ORDER BY price ) as NTILES
FROM products;
