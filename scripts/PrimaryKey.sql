/*******************************************************************************
********************** LA Primary Key     **************************************
********************************************************************************/

-- La PK  n’accepte pas les doublons ni les NULL.

-- Contrairement a UNIQUE qui accepte les NULL, mais non les doublons.

-- Une table ne peut contenir qu’une seule PK.

--- Creation d'une table classique avec la PK

CREATE TABLE Primary_key
(  
   Nom varchar (200) PRIMARY KEY,  
   personne varchar (200)
)


-- Sur PGadmin ?

--- Peut on inserer une valeur NULL dans une PK ? 

insert into Primary_key values (NULL,'TOTO')


--- Peut on inserer un doublon ? 

insert into Primary_key values ('thuillier','olivier') --1ere insertion ok

insert into Primary_key values ('thuillier','olivier')

-- Que donne le SELECT ? 

select * from Primary_key


--- Peut on inserer mettre une deuxieme PK ? 

ALTER TABLE Primary_key ADD PRIMARY KEY (personne)

--- ajout de la contrainte UNIQUE sur une PK  ? 

drop table Primary_key

CREATE TABLE Primary_key
(  
   Nom varchar (200) UNIQUE PRIMARY KEY  
)


drop table Primary_key

--- ajout de la contrainte CHECK sur une PK  ? 

CREATE TABLE Primary_key
(  
   Nom varchar (200) PRIMARY KEY check (nom in ('THUILLIER')) 
 )

-- Insertion de valeur pour Tester

insert into primary_key values ('OLIVIER')

-- Que donne le SELECT ? 

select * from Primary_key

-- Insertion : 

insert into primary_key values ('THUILLIER')

-- On supprime la table 

drop table Primary_key

--- ajout de la contrainte DEFAULT sur une PK ?


CREATE TABLE Primary_key
(  
   Nom varchar (200) default 'TOTO' PRIMARY KEY -- Rajout de la contrainte DEFAULT

)

-- Insertion de valeur pour Tester

insert into primary_key values (DEFAULT)

-- Que donne le SELECT ? 

select * from Primary_key
