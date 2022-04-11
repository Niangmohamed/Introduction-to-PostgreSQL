/*******************************************************************************
********************** CONTRAINTE CHECK et UNIQUE   ****************************
********************************************************************************/

--- Creation d'une table classique 

CREATE TABLE Personne (
    Nom varchar(255) NOT NULL,
    Prenom varchar(255),
    Age int,
    CHECK (Age < 5) --- Contrainte CHECK
)
 -- Jeter un oeil en sur Pgadmin

 -- Rajout d'une nouvelle ligne

 insert into Personne values ('THuillier','olivier',4)
 
 -- et 5 ? 
 
  insert into Personne values ('THuillier','olivier',5)

 -- Que donne le SELECT? 

 select * from personne

 -- Et si je rajoute une valeur NULL ? 

  insert into Personne values ('THuillier','olivier',NULL)

 -- Que donne le SELECT? 

 select * from personne

-- Drop de la contrainte 

ALTER TABLE Personne DROP CONSTRAINT personne_age_check

-- Peut on rajouter la contrainte sur une table existante ? 

ALTER TABLE Personne ADD CHECK (Age  < 10)

-- Supprimons la table

drop table Personne

-- Et une contrainte pour une valeur donnée ? 

create table Valeur_donne ( Valeur varchar (200) ,  CHECK (valeur in ('TOTO','TITI')))

-- Insertion de valeurs 
insert into Valeur_donne values ('TITI');
-- et la ? 
insert into Valeur_donne values ('TUTU');

-- Et une contrainte CHECK sur plusieurs colonnes ? 

CREATE TABLE Personne (
    Nom varchar(255) NOT NULL,
    Prenom varchar(255),
    Age int,
    CHECK (Age between 5 and 10 and Nom ='THUILLIER' ) --- Contrainte CHECK sur deux colonnes
)
-- Insertion de valeurs
 insert into Personne values ('THUILLIER','olivier',5)

 -- ok et si je mets autre chose que THULLIER ? 

 insert into Personne values ('THUILLIER_2','olivier',5)-- si ce n'est pas thuillier ca ne passe pas

   -- ok et si je mets l'age a 11 ?

 insert into Personne values ('THUILLIER','olivier',11)

/*******************************************************************************
********************** UNIQUE   ***********************************************
********************************************************************************/

CREATE TABLE Table_unique (Nom varchar (200) NULL UNIQUE ,prenom varchar (200))

 -- Commencons par une insertion simple

insert into Table_unique values ('Thuillier','olivier');

-- et la ? 

insert into Table_unique values ('Thuillier','bruno')


-- Peut on inserer une valeur NULL ? 

  insert into Table_unique values (NULL,'olivier')

-- Que donne le SELECT ?

  select * from Table_unique

  -- Peut on creer une table avec une colonne UNIQUE et un DEFAULT ? 

  CREATE TABLE UNIQUE_DEFAULT (
    Nom varchar (200) NULL UNIQUE ,
	prenom varchar (200)DEFAULT 'TOTO' )

-- et si j'insere des données 

INSERT INTO UNIQUE_DEFAULT values ('olivier',DEFAULT)

-- Que donne le select ? 

select * from UNIQUE_DEFAULT


-- peut on creer plusieurs colonnes UNIQUE dans une table ? 

  CREATE TABLE UNIQUE_2 (
    Nom varchar (200) NULL UNIQUE ,
	prenom varchar (200)UNIQUE)
	

-- La contrainte UNIQUE ne cree pas d'index non clustered par defaut, pas comme sur SQL Server
 


