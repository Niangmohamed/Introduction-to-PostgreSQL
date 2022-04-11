/******************************************************************************
**********************  IN ,NOT IN, IS NULL et IS NOT NULL        *************
*******************************************************************************/

-- Que donne le select de la table contact

select * from contact

-- Je veux le nom dutruel dans ma requete : 

select * from contact where nom  in ('Dutruel')

-- Idem je ne veux que les femmes dans ma requete

select * from contact where sexe not in ('M')

--- je peux meme mettre plusieurs valeurs dans le IN et le NOT IN 

-- Je veux le nom dutruel et thuillier dans ma requete : 

select * from contact where nom  in ('Dutruel','Thuillier')

-- Je ne veux pas thuillier et dutruel dans ma requete 

select * from contact where nom  not in ('Dutruel','Thuillier')

-- Insertion d'une nouvelle valeur NULL dans la table contact
-- Sur SQL une valeur nulle represente Rien, cela veut que le champ n'est pas renseigné

-- On ne renseigne pas la date d'adhésion on lui met une valeur NULL
insert into contact values ('Bourgeon','elodie',43,'F',NULL)

-- Que donne le select de la table contact

select * from contact where nom ='Bourgeon'

--- on voit bien le NULL dans la colonne date de naissance

--- Si on veut les dates de naissance qui ne soient pas nuls, c'est a dire renseigné

select * from contact where date_de_naissance is not null

--- Et a contrario si on veut les dates de naissance qui ne sont pas renseignées

select * from contact where date_de_naissance is  null

