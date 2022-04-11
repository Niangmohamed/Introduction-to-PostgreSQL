/*******************************************************************************
********************** FULL OUTER JOIN       ***********************************
********************************************************************************/
-- c'est parti pour la requete en FULL OUTER JOIN avec les deux SELECT en meme temps

select A.IDclient,B.IDclient from commande A

full outer  join client B
  
on A.IDclient =B.IDclient

select * from commande

select * from client

-- On voit qu'il y a toutes les lignes de la table commande qui sont ramenés de 1 a 9 
-- On voit les 2 NULL en bas car 12 et 13 n'est pas reference dans la table commande (valeur 12 et 13)
-- On voit qu'il y a toutes les lignes de la table client (1,3,5,12,13)
-- On voit les 5 NULL qui correspondent a la table commande (2,4,6,8,9)

-- et si on rajouter le ISNULL pour le filtre

select * from commande
go
select * from client

select * from commande A

full outer  join client B
  
on A.IDclient =B.IDclient 

where B.IDclient is null

-- La OUTER est il facultatif ? 

select * from commande A

full join client B
  
on A.IDclient =B.IDclient 

where B.IDclient is null