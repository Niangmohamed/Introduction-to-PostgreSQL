/******************************************************************************
********************************  HAVING **************************************
*******************************************************************************/

-- La condition HAVING en SQL est presque similaire à WHERE à la seule différence que HAVING permet de filtrer en utilisant des fonctions telles que SUM()

--Comptez moi le nombre de personne qui sont de sexe masculin, et qui ont entre 20 et 25 ans?

select count(*)as Total ,sexe,age  from contact
where  sexe ='M' and age between 20 and 25 
group by sexe,age

--- ok mais je veux les totaux supérieurs a 2 ?

-- Ha ?

select count(*)as Total ,sexe,age from contact
where  sexe ='M' and age between 20 and 25
and Total > 2 --- Essayons comme ca ? 
group by sexe,age


--marche pas

--Le WHERE ne peut pas prendre de fonction d'agregat comme le SUM etc...

-- par contre le HAVING le fait...

select count(*)as Total ,sexe,age as Total from contact
where  sexe ='M' and age between 20 and 25
group by sexe,age
having count(*) > 2


-- Et si j'essaye le SUM ? 

select count(*)as Total ,sexe,age as Total from contact
where  sexe ='M' and age between 20 and 25
group by sexe,age
having sum(1) > 2

-- Et si je mets le HAVING avant le GROUP BY ?

select count(*)as Total ,sexe,age as Total from contact
where  sexe ='M' and age between 20 and 25
having count(*) >1 
group by sexe,age

-- Le Having est toujours apres le GROUP BY