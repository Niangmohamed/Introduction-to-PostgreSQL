/*******************************************************************************
**********************    OVERLAY et POSITION    ******************************
********************************************************************************/

-- La fonction  OVERLAY (couvrir/recouvrir) est utilisé pour remplacer un Texte ou une chaîne, par un 
-- autre texte ou sous chaîne 

SELECT overlay('w1234567rce' placing 'resou' from 3)

-- On part du 3eme caractère et on le remplacer par Resou

-- On peut aussi 

SELECT overlay('w1234567rce' placing 'resou' from 3 for 5);

-- On part du 3eme caractère(inclus),et on remplace  les 5 prochains caractères par resou


SELECT overlay('w1234567rce' placing 'resou' from 3 for 6);  

-- On part du 3eme caractère(inclus),et on remplace  les 6 prochains caractères par resou

--La fonction de position PostgreSQL est utilisée pour trouver l'emplacement d'une sous-chaîne dans une chaîne spécifiée.

SELECT POSITION('our' in 'w3resource')


-- Et si on cherchait la position de la lettre A dans notre table ? 

SELECT prenom,
POSITION('a' IN prenom)
FROM contact

-- REVERSE vous l'aurez compris inverse la chaîne de caractère

SELECT reverse('w3resource')

