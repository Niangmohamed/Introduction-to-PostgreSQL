/*******************************************************************************
********************** DEMO  SELECT et le WHERE    *****************************
********************************************************************************/
USE BDD 
GO

--- le simple SELECT 

select * from nom

--- Et si je veux selectionner juste une colonne  ?

select prenom from nom

--- Et si je veux selectionner les deux colonnes par leur nom ?

select prenom,nom from nom 

-- et si j'inverse le nom des colonnes ? 

select nom,prenom from nom

-- Si j'enleve le FROM ? 

select nom, prenom nom


/*******************************************************************************
********************** et le WHERE dans tout ca ?     **************************
********************************************************************************/

-- je veux chercher le nom Peter commen faire ?

select * from nom where nom ='le roi'

-- La colonne dans le WHERE est elle obligatoire ?

select * from nom nom ='le roi'