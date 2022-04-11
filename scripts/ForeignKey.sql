/*******************************************************************************
********************** La Foreign  Key     **************************************
********************************************************************************/

--- Creation d'une table classique avec la PK

CREATE TABLE Parent
(  
   Nom varchar (200) PRIMARY KEY ,  
   personne varchar (200)
)

-- Inserons des valeurs dans cette table 

Insert into Parent values ('thuillier','oliver')


--- Creation d'une table classique avec la FK

CREATE TABLE Enfant
(  
   Nom varchar (200) ,  
   adresse varchar(200),
	FOREIGN KEY (nom) REFERENCES parent(Nom) 
   ) -- LA FK

-- Inserons des valeurs dans cette table 

Insert into enfant values ('thuillier','7 rue TOTO')

-- Regardons sur Pgadmin la FK

-- Si je scripte la FK on voit bien qu'elles sont liés comme un parent et un enfant

-- que donne le SELECT sur les deux tables ?

select * from parent;

select * from enfant

-- meme Nom Thuillier dans les deux colonnes

-- Que se passe t il si je modifie la valeur dans la PK 

update parent set nom='thuillier_2' where nom ='thuillier'

-- On ne peut pas modifier la table parent, par le simple fait qu'elle a une relation enfant

-- et si je modifiais la table enfant ? 

update enfant set nom='thuillier_2' where nom ='thuillier'

-- On ne peut pas modifier la table enfant, par le simple fait qu'elle a une relation parent


--- Mais alors comment sortir de cette impasse ? 

-- il faut desactiver la contrainte sur la FK, pour pouvoir modifier la table soit parent soit enfant

ALTER TABLE enfant DISABLE TRIGGER ALL

-- et si je modifiais la table enfant ? 

update enfant set nom='thuillier_2' where nom ='thuillier'

-- et si je modifiais la table parent ? 

update parent set nom='thuillier_3' where nom ='thuillier'


-- que donne le SELECT sur les deux tables ?

select * from parent

select * from enfant

-- Pour reactiver la contrainte 

ALTER TABLE enfant ENABLE TRIGGER ALL;

-- et si je reessaye un UPDATE ? 

update enfant set nom='thuillier' where nom ='thuillier_2'

drop table enfant
drop table parent