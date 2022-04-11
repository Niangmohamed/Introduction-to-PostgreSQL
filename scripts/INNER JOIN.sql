/*******************************************************************************
********************** INNER JOIN       ****************************************
********************************************************************************/
USE [BDD]
go
-- creation de deux tables pour exemple

create table commande (Numerodecommande int,IDclient int)
go
create table client (nom varchar (200),prenom varchar (200), IDclient int, adresse varchar(2000),ville varchar(200))

-- Insertion de valeur dans les tables

insert into commande values 
('3712',1),
('4851',2),
('6712',3),
('3215',4),
('3218',5),
('3220',6),
('3221',7),
('3227',8),
('3238',9)

insert into client values 
('Thuillier','Olivier',1,'7 Rue poirier','Dreux'),
('Thuillier','Luc',3,'78 avenue de paris','Paris'),
('Thuillier','Théodore',5,'15 Rue asterdam','Asterdam'),
('Thuillier','Zinédine',12,'7 Rue Prague','Prague'),
('Thuillier','Lucas',13,'7 Rue Vienne','Vienne')

-- Que donne les deux Select 

select * from commande
go
select * from client

-- ok premiere question je veux les clients qui ont un numéro de commande

select A.Numerodecommande,A.IDclient,B.prenom,B.nom from commande A

inner join client B

On A.IDclient=B.IDclient


--Je veux aussi le nom et prenom des personnes 

select A.numerodecommande, A.IDclient,B.nom,b.prenom from commande A

inner join table_client B
  
on A.IDclient =B.IDclient
 

-- le INNER Join est complétement facultatif...

select A.numerodecommande, A.IDclient,B.nom,b.prenom from commande A

join client B
  
on A.IDclient =B.IDclient

-- Contrairement a une idée recue,il y aussi aucune incidence sur l'ordre des jointures dans la jointure elle meme

select A.numerodecommande, A.IDclient,B.nom,b.prenom from commande A

join client B
  
on A.IDclient =B.IDclient

 go

 select A.numerodecommande, A.IDclient,B.nom,b.prenom from commande A -- On change l'ordre de jointure des deux colonnes

join client B
  
on B.IDclient =A.IDclient -- On change l'ordre de jointure des deux colonnes



