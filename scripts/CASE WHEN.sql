/*******************************************************************************
**********************     CASE WHEN     ***************************************
********************************************************************************/

-- Évalue une liste de conditions et retourne une expression de résultat parmi plusieurs possibilités.

select * from Contact

-- dans l'exemple on va dire que dans la colonne sexe les F sont des Mme 
-- et que les H sont des Mr

select  *, 
case 
when sexe ='F' then 'Mme'
when sexe ='M' then 'Mr'
end

from Contact 

-- on peut mettre plusieurs CASE WHEN dans la requete et aussi rajouter un ELSE 

select  *,
case 
when age between 16 and 20  then 'vive la jeunesse' ELSE 'on a plus 20 ans :)'
end
from Contact 
