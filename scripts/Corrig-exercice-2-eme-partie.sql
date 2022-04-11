/******************************************************************************
********************************  Exercice TSQL Partie 2 **********************
*******************************************************************************/

select * from contact

--1 : Comptez moi le nombre de personne dont le prénom est Ludivine?

select count(*) as Total  from contact
where  prenom ='Ludivine'

-- Pour verifier 
  
select * from contact where prenom ='Ludivine'

-- 2 / Faites moi la somme de femmes qui sont nées en 1983.

select sum(1) from contact 
where date_de_naissance::text like  '1983%'

select count(date_de_naissance) from contact 
where date_de_naissance::text like  '1983%'

-- Et si on verifie : 

select *  from contact 
where date_de_naissance::text like  '1983%'


-- 3/ Comptez moi le nombre de femmes qui ont entre 20 et 45 ans dont le nombre est supérieur à 1 en classant l'age par ordre décroissant.
  
select count(*) sexe,age from contact 
where age between 20 and 45 
group by sexe,age
having count(*) >1 
order by age desc

-- 4 / Comptez moi les lignes distinctes dans la colonne sexe

select count(distinct sexe) from contact

-- 5/ Selectionnez moi les personnes qui n'ont pas entre 20 et 27 ans

select * from contact where age not between 20 and 27 

--6/ Comptez moi les personnes qui ont la lettre A dans leur prénom, qui ont entre 18 et 40 ans, de sexe masculin et dont le total est supérieur a 1

select count(*),age,sexe from contact 
where prenom like '%a%' and age between 18 and 40 and sexe ='M'
group by age,sexe
having count (*) >1

-- 7 : Construisez une requête avec comme résultat, les personnes qui ont moins 20 ans quils ont toute la vie devant eux. (CASE WHEN). 

select  *, case when age < 20 then 'Vous avez toute la vie devant vous ' end  from contact
