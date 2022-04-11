
/*******************************************************************************
********************** Corrigé exercice    *************************************
********************************************************************************/

--1:/ creation de la table Etudiant avec trois colonnes une 
-- s'appelant Nom avec un varchar(200), l'autre prenom char(10) , et la derniere avec l'age en INT

create table etudiant (nom varchar(200),prenom char (10), age int)

--2:/ Insertion de 5 lignes dans la table : 

Insert into etudiant values

 ('Marchand','Elisabeth',18),
 ('Truchon','Melanie',16),
 ('Teslu','Sandrine',17),
 ('Portail','Bruno',23),
 ('Virenque','Michel',22)


--- Qu'il y a t il dans ma table 
select * from etudiant

-- Selectionne moi l'etudiante qui s'appelle Teslu

select * from etudiant where nom ='Teslu'

-- Changer l'age Melle Sandrine teslu et lui mettre 18 ans

update etudiant set age ='18' where nom ='Teslu'

--- Qu'il y a t il dans ma table 

SELECT * from etudiant

-- Supprimer de la table l'etudiant qui s'appele Virenque Michel

delete from etudiant where nom ='Virenque'

--- Qu'il y a t il dans ma table 

SELECT * from etudiant

