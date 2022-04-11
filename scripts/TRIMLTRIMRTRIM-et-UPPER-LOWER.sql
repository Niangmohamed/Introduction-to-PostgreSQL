/*******************************************************************************
********************** TRIM LTRIM RTRIM     ************************************
********************************************************************************/
-- Supprime le caractère spécifié au début ou à la fin d’une chaîne.
--- a gauche ? 

select LTRIM('entreprise','e') 

--- a droite ? 

select RTRIM('entreprise','e')


--- des deux cotés  ? 

select BTRIM('entreprise','e')

-- Ou 

select btrim('xyxtrimyyx', 'xy')

/*******************************************************************************
********************** UPPER LOWER      ***************************************
********************************************************************************/

--  permet de transformer un texte en minuscule et en MAJUSCULE :

-- Mettons la colonne nom en Majuscule : 

select upper(nom) from contact

-- et en minuscule 

select lower(nom) from contact