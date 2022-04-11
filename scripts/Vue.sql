/******************************************************************************
********************************  Creation d'une vue **************************
*******************************************************************************/

select * from contact

--J'ai la requete ci dessous : 

select count(*) as Total,sexe,date_de_naissance from contact
where date_de_naissance::text like '%1976%' and sexe like 'M'
group by sexe,date_de_naissance

-- Le probleme c'est que je dois a chaque soit sauvegarder la requete 
-- ou soit la retaper a la main, c'est un peu fastidieux n'est ce pas ? 

-- Pour solutionner ce probleme pourquoi ne pas creer une vue ? 

Create view Simple_vue 
as
select count(*) as Total,sexe,date_de_naissance from contact
where date_de_naissance::text like '%1976%' and sexe like 'M'
group by sexe,date_de_naissance

-- Si on regarde sur Pgadmin ? 

-- Maintenant il faut juste faire un select de la vue 

select * from Simple_vue

-- Je peux aussi mettre des filtres dans ma vue, je peux appeler juste une colonne

select  total from Simple_vue 

-- Plus besoin de retaper la requete elle est maintenant enregistrée par une vue.

-- Cas pratique : 

--Je veux que par exemple Sebastien ne voit que les personnes qui ont moins de 30 ans

-- par contre je veux que par exemple Bruno voit les personnes qui ont plus de 30 ans

-- creation de la vue pour sebastien

create view vue_sebastien
as 
select * from contact where age < 30 

-- Que donne le select de la vue pour Sebastien ? 

select * from vue_sebastien

-- sebastien ne voit bien que les personnes qui ont moins de 30 ans

-- creation de la vue pour Bruno

create view vue_bruno
as

select * from contact where age > 30 

-- Que donne le select de la vue pour Bruno ? 

select * from vue_bruno

-- Bruno ne voit bien que les personnes qui ont plus de 30 ans

-- peut on mettre un update dans une Vue ? 

create view test_update 
as 
update contact set nom ='marchand_2' where nom ='marchand'

-- Non pas possible

-- peut on mettre un delete  dans une Vue ? 

create view test_delete
as 
delete contact where nom ='marchand' 

-- Non pas possible

-- peut on mettre un INSERT  dans une Vue ? 

create view test_delete
as 
insert into  contact values ('test','test',250,'2070-2-15')

-- Non pas possible

--Je veux changer un morceau de ma requete dans ma vue, je veux changer le M par F

--donc 

ALTER VIEW Simple_vue 
as
select count(*) as Total,sexe,date_de_naissance from contact
where date_de_naissance::text like '%1976%' and sexe like 'F'
group by sexe,date_de_naissance

-- Impossible il faut supprimer la vue et la recreer

-- Puis je renommer ma vue ? 

ALTER VIEW Simple_vue rename to simple_vue2

-- La  vue a été renommé en Simple_vue.2

-- Suppression de la vue par la commande DROP VIEW :

drop view  Simple_vue2


