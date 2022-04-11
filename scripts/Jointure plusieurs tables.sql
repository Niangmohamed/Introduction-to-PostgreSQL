/*******************************************************************************
********************** Jointure sur plusieurs tables       ***********************************
********************************************************************************/
-- Créons un troisiéme table

Create table carte_fidelité (Fidele char(3), IDCLIENT int)

-- Et insérons quelques valeurs

insert into carte_fidelité values 
('OUI', 1),
('OUI', 2),
('NON', 3),
('OUI', 4),
('NON', 5),
('OUI', 6),
('NON', 7),
('OUI', 8),
('OUI', 9),
('NON', 10),
('OUI', 11),
('NON', 12)

-- Si on fait les trois SELECT ?

select * from commande

select * from client

select * from carte_fidelité

-- Question : je veux les clients qui ont bien un numéro de commande
-- mais aussi qui ont une carte de fidélité 


-- c'est parti pour la requete sur la jointure sur plusieurs tables


select A.IDclient from commande A

inner join client B 

on B.IDclient=A.IDclient

inner join carte_fidelité C

on B.IDclient=C.IDCLIENT

where C.Fidele='OUI'


















select * from commande
go
select * from client

-- On voit qu'il y a toutes les lignes de la table commande qui sont ramenés de 1 a 9 
-- On voit les 2 NULL en bas car 12 et 13 n'est pas reference dans la table client (valeur 12 et 13)

-- si on essaye prend B.IDclient on aura logiquement 1,3,5,12,13

select B.IDclient from commande A

full outer  join client B
  
on A.IDclient =B.IDclient

select * from commande
go
select * from client

-- Pour enlever les valeurs concordantes on doit rajouter le filtre isnull

select * from commande A

full outer  join client B
  
on A.IDclient =B.IDclient

where B.IDclient is null

select * from commande
go
select * from client


-- Est ce que le OUTER join est facultatif ? 


select * from commande A

full  join client B
  
on A.IDclient =B.IDclient

where B.IDclient is null