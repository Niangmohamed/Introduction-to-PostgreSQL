/*******************************************************************************
********************** CONTRAINTE DEFAULT   ************************************
********************************************************************************/
--- Creation de la table avec la valeur DEFAULT

create table TEst_Default ( Test varchar(200) default 'TOTO',email varchar (200))

--Faisons une insertion simple  :

insert into TEst_Default values ('olivier','defaut@defaut.com')

-- Que donne le select ?

select * from TEst_Default

-- Insertion d'une valeur avec la valeur DEFAULT

insert into TEst_Default values (DEFAULT,'defaut@defaut.com')

-- Que donne le select ?

select * from TEst_Default

-- Ajout d'un defaut sur une table existante  si je mets une valeur 
 
 alter table TEst_Default alter column email SET DEFAULT 'pas dadresse email'

 -- Rajout d'une nouvelle ligne

 insert into TEst_Default values (DEFAULT,DEFAULT)

 -- Que donne le select ?

select * from test_default






