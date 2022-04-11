/*******************************************************************************
**********************  UNION et UNION ALL/IF ELSE   ***************************
********************************************************************************/
USE BDD
GO
--- C’est donc une commande qui permet de concaténer les résultats de 2 requêtes ou plus
-- Il faut par contre que chacune des requetes a concatener retourne le meme nombre de colonnes.

-- exemple de deux tables, on va creer une autre table contact 

create table client_1 (nom varchar(20), prenom varchar(20), age int)

insert into client_1 values 
('Marchand','Elisabeth','18'),
('Truchon','Melanie','18')

create table client_2 (nom varchar(20), prenom varchar(20), age int)

insert into client_2 values 
('Marchand','Elisabeth','18'),-- en doublon
('Thuillier','olivier','18') 


-- Que donne les deux SELECT ? 

select * from client_1
go 
select * from client_2

-- Que donne l'UNION 

select * from client_1
UNION 
select * from client_2

-- Concatenation des deux requetes en enlevant le doublon de Mme Marchand

-- a l'inverse UNION ALL prend les doublons

select * from client_1
UNION ALL
select * from client_2


-- L' IF THEN ELSEinstruction exécute une commande lorsque la condition est vraie et elle exécute une commande 
-- alternative lorsque la condition est fausse. Ce qui suit illustre la syntaxe de l' IF THEN ELSEinstruction:

DO $$
DECLARE
  a integer := 10;
  b integer := 20;
BEGIN 
   IF a > b THEN 
      RAISE NOTICE 'a is greater than b';
   ELSE
      RAISE NOTICE 'a is not greater than b';
   END IF;
END $$;

