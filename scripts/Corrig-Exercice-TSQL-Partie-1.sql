/******************************************************************************
********************************   Exercice TSQL Partie 1         *************
*******************************************************************************/


-- Que donne le select sans le distinct ? 

select age from contact

--  1 / Enlevez moi les doublons dans la colonne âge.

select distinct age  from contact

-- 2 / Sélectionnez moi les dates de naissance commençant par 1976, en renommant la colonne  Année_1976.

select nom,prenom,sexe,date_de_naissance  as Année_1976  from contact where date_de_naissance::text like '1976%'

-- 3 / Selectionnez moi les personnes qui sont nées le 1er janvier

select * from contact where date_de_naissance::text like '%01-01%'

-- 4 / Selectionnez moi les prenoms qui finissent par la lettre E

select * from contact where prenom like '%e'

-- 5 / Une requête sortant juste les femmes(de  2 façons différentes).

select * from contact where sexe not in ('M')
-- ou 
select * from contact where sexe <> ('M')

--6 / Sélectionnez moi dans la requête les personnes qui ont 17 ans et moins de 17 ans.

select * from contact where age <= 17

-- 7 / selectionnez juste les personnes qui n'ont pas 17 ans et 48 ans

select * from contact where age  not in (17,48)

--- 8 / selectionnez moi les 7 premieres lignes de la table 

select  * from contact limit 7

--- 9 / Creez moi une nouvelle table contact_portail a partir de la table contact

create table contact_portail as select  * from contact 

-- Que donne le SELECT dans la nouvelle table ? 

select * from contact_portail

