/*******************************************************************************
********************** LEFT JOIN VS NOT IN VS NOT EXISTS      ******************
********************************************************************************/

-- Question: Quel client n'est pas rattaché a un IDCLIENT dans la table commande? 

select * from commande

select * from client


select B.IDclient,B.nom,B.prenom from client B

left join commande A
  
on A.IDclient =B.IDclient

where A.IDclient is NULL


-- Que donne le resultat en NOT IN ? 

select IDclient,nom,prenom 

from client 

where Idclient not in 
(
select Idclient 
from commande

)

-- Que donne le resultat en NOT EXISTS ? 

select B.IDclient,B.nom,B.prenom 

from client B

where not exists
(
select *
from commande A 
where B.IDclient=A.IDCLIENT

)
