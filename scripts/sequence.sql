/*******************************************************************************
********************** SEQUENCE  **********************************************
********************************************************************************/

-- Par définition, une séquence est une liste ordonnée d'entiers. Les ordres de nombres dans la séquence sont importants. 
-- Par exemple, {1,2,3,4,5}et {5,4,3,2,1}sont des séquences entièrement différentes.

-- Une séquence dans PostgreSQL est un objet lié au schéma défini par l'utilisateur qui génère une séquence d'entiers basée sur une spécification spécifiée.

-- Une séquence est une sorte de table particulière qui permet de générer un nombre proprement.
-- Les nombres générés proviennent d'une suite que l'on aura au préalable paramétrée dans la séquence.


--- creation d'une sequence simple, avec un increment de 5 et qui demarre a 100

CREATE SEQUENCE masequence
INCREMENT 5 
START 100

-- Sur PGadmin
-- On peut voir la prochaine valeur de la sequence

SELECT nextval('masequence')

-- Creation d'une autre sequence 

CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE


SELECT nextval('three')

-- On peut bien sur attacher une sequence a une table

CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    product_id VARCHAR(200) NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
)

-- Et rattacher cette sequence a la table : 

CREATE SEQUENCE order_item_id
START 10 -- Debut de l'increment
INCREMENT 10 -- Par saut de 10
MINVALUE 10 -- Valeur minimum
OWNED BY order_details.item_id;

-- Que donne linsertion des données : 

INSERT INTO 
    order_details(order_id, item_id, product_id, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);

-- et le SELECT 

select * from order_details

-- On peut le creer aussi sur une autre table

CREATE TABLE order_details_2(
    order_id SERIAL,
    item_id INT NOT NULL,
    product_id VARCHAR(200) NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
)

-- Insertion de donnée :

INSERT INTO 
    order_details_2(order_id, item_id, product_id, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);
	
	-- et le SELECT 

select * from order_details_2

-- Il a pris les valeurs suivantes 40,50,60

-- Quelle sera sa prochaine valeur ?

SELECT nextval('order_item_id')

-- une Sequence peut être modifier 

ALTER SEQUENCE order_item_id
INCREMENT BY 10

SELECT nextval('order_item_id')

-- Et si je veux repartir a 10 ?

ALTER SEQUENCE order_item_id
restart 10

SELECT nextval('order_item_id')

-- On peut aussi lui affilier une valeur MAX : 


CREATE SEQUENCE order_max
START 1 -- Debut de l'increment
INCREMENT 1 -- Par saut de 10
MaxVALUE 2 -- Valeur minimum
OWNED BY order_details.item_id;

truncate table order_details


INSERT INTO 
    order_details(order_id, item_id, product_id, price)
VALUES
    (100, nextval('order_max'),'DVD Player',100),
    (100, nextval('order_max'),'Android TV',550),
    (100, nextval('order_max'),'Speaker',250);

-- ERROR:  ERREUR:  nextval : valeur maximale de la séquence « order_max » (2) atteinte
