/******************************************************************************
******            Creation dune table a partir dun SELECT  ********************
*******************************************************************************/
--- Que donne le select ? 

select * from contact 

--creation de la table a partir du SELECT 

Create table contact_SELECT2 as select * from contact

----creation de la table a partir du SELECT sans donnée

Create table contact_SELECT2 as select * from contact with no data
