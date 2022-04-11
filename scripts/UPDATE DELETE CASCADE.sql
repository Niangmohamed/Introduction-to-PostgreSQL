/*******************************************************************************
*****                La cascade dintegrite referentielle  ********************
********************************************************************************/

--- Creation de deux tables 

CREATE TABLE Test_on_cascade (
    ID int PRIMARY KEY ,
    Nom varchar(200) NOT NULL,
    Prenom varchar(200)
	)

CREATE TABLE Test_on_cascade_2 (
    ID int PRIMARY KEY,
    Nom varchar(200) NOT NULL,
    Prenom varchar(200)
	) 
-- insertion d'un simple ligne classique sur les deux tables

insert into test_on_cascade values (1,'olivier','thuillier');

insert into test_on_cascade_2 values (1,'olivier','thuillier')

--- le select 

select * from Test_on_cascade

select * from Test_on_cascade_2

-- rajout des FK

ALTER TABLE Test_on_cascade_2 add constraint Test_on_cascade_2 FOREIGN KEY (ID) REFERENCES Test_on_cascade(ID)

-- le delete ? 

delete from Test_on_cascade where ID =1

-- DELETE conflit c'est logique

-- l'update ? 

update  Test_on_cascade set ID =2

-- UPDATE conflit c'est logique

-- Suppresion de  la contrainte 

ALTER TABLE Test_on_cascade_2 DROP CONSTRAINT Test_on_cascade_2


-- rajout des FK avec le DELETE CASCADE : 

ALTER TABLE Test_on_cascade_2 add constraint Test_on_cascade_2 FOREIGN KEY (ID) REFERENCES Test_on_cascade(ID) ON DELETE CASCADE


-- le delete ? 
begin transaction

delete from Test_on_cascade where ID =1

-- la ca marche

-- et le Select 
select * from Test_on_cascade

select * from Test_on_cascade_2

rollback
-- et L'update ? 

update  Test_on_cascade set ID =2

-- Suppresion de la contrainte 

ALTER TABLE Test_on_cascade_2 DROP CONSTRAINT Test_on_cascade_2

-- On vide les tables 

truncate table Test_on_cascade;
truncate table Test_on_cascade_2


-- insertion d'un simple ligne classique 

insert into test_on_cascade_2 values (1,'olivier','thuillier');

insert into test_on_cascade values (1,'olivier','thuillier')

-- ajout de la contrainte UPDATE et DELETE 

ALTER TABLE Test_on_cascade_2 add constraint Test_on_cascade_2 FOREIGN KEY (ID) REFERENCES Test_on_cascade(ID) ON UPDATE  CASCADE ON DELETE CASCADE

--- On peut mettre l'UPDATE et le DELETE en meme temps.

-- et L'update ? 
update  Test_on_cascade set ID =2

-- la ca marche

select * from Test_on_cascade;

select * from Test_on_cascade_2

