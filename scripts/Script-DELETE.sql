/*******************************************************************************
**********************  DEMO  DELETE et le WHERE	   *************************
********************************************************************************/
-- Que donne le Select  ?

select * from nom

-- Et si je veux supprimer juste la valeur dagobert  ?

delete from nom where prenom ='dagobert'

-- Que donne le Select  ?

select * from nom


-- Et si ne mets pas le WHERE   ?

delete from nom

-- La il n'y a plus rien ...d'ou l'importance du WHERE...

select * from nom