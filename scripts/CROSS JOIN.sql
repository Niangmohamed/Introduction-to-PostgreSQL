/*******************************************************************************
********************** CROSS JOIN      ****************************************
********************************************************************************/
USE [BDD]
go
-- Que donne les deux Select 

select * from commande
go
select * from Table_client

-- On voit qu'il y a comme colonne en commum l'IDclient

-- c'est parti pour la requete 

select * from commande A

cross join table_client B

-- On voit qu'il y a 45 lignes, 9 lignes dans la table commande et 5 lignes dans la table table_client
-- donc 9*5 = 45 lignes
-- on voit qu'en faisant un select * de la table commande que Thuillier olivier est multiplié sur sur les 9 premieres lignes de la table table_client

-- Et si on change l'ordre de jointure ? 

-- Que donne les deux Select 

select * from commande
go
select * from Table_client

-- et la jointure

select * from table_client B

cross join commande A


-- On voit qu'il y a 45 lignes, 9 lignes dans la table commande et 5 lignes dans la table table_client
-- donc 9*5 = lignes


