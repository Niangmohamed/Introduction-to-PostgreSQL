/*******************************************************************************
*************L'agregation avec les fonctions de RANKING     *********************
********************************************************************************/

-- Creation d'une simple table :

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

truncate table produit

-- Question : Comment je fais pour avoir une colonne avec juste la somme de microsoftlumia dans ma Stock

select  product_name,price ,sum(price) from produit 
where product_name ='Microsoftlumia'
group by product_name,price

select  product_id, product_name, max(price) , count(product_name) as num_prod from produit 
group by product_id, product_name
order by product_id

-- Ok mais je fais comment pour l'afficher avec toutes les autres lignes ? 

select  product_id, product_name, price, 
count (*) over(partition by product_id order by product_id) from produit

-- Et si je veux la moyenne des prix des kindle fire ? 

select  
product_id,product_name,price, 
avg(price) over(partition by product_name order by product_id) 

from produit

