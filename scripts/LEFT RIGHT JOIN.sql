/*******************************************************************************
********************** LEFT/RIGHT JOIN       ****************************************
********************************************************************************/

-- On reprend les deux mêmes tables :

-- Que donne les deux Select 

select * from commande

select * from client

-- Question: Quel client n'est pas rattaché a un IDCLIENT dans la table commande? 

select B.IDclient, B.nom,B.prenom from client B

left join commande A
  
on A.IDclient =B.IDclient

-- Ca ne marche pas et pourquoi pas avec le filtre IS NULL pour ramener que les valeurs qui ne correspondent qu'a la table de gauche ? 

select B.IDclient,B.nom,B.prenom from client B

left join commande A
  
on A.IDclient =B.IDclient

where A.IDclient is NULL

-- La Ca fontionne

-- On voit parfois la valeur OUTER qui est facultatif

select B.IDclient,B.nom,B.prenom from client B

left outer join commande A
  
on A.IDclient =B.IDclient

where A.IDclient is NULL


-- Question: On peut recommencer la meme operation avec le RIGHT JOIN en inversant les tables

select B.IDclient,B.nom,B.prenom from commande A

right join client B
  
on A.IDclient =B.IDclient

where A.IDclient is NULL

-- On voit parfois la valeur OUTER qui est facultatif

select B.IDclient,B.nom,B.prenom from commande A

right outer join client B
  
on A.IDclient =B.IDclient

where A.IDclient is NULL

