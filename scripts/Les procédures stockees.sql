/******************************************************************************
******************   Les procédures stockees  ? *******************************
*******************************************************************************/

-- Postgresql ne supporte pas les procédures stockées sauf depuis postgresSQL 11

-- Créons une PS qui va inserer des données dans la table contact

--J'ai la requete ci dessous : 

select * from contact

-- Cas pratique : Je n'ai pas envie de taper tous les jours un script d'insert de 3 lignes ?
-- et si je l'integrais a une procedure stockée ? 

-- creation de la procedure avec un INSERT : 

CREATE OR REPLACE PROCEDURE Ps_insert_data(_nom text, _prenom text, _age integer,
                          _sexe text, _date_de_naissance date)
LANGUAGE SQL -- Langage utilisé SQL ou PLpsSQL
as $$ -- on peut l'appeler TOTO aussi
INSERT INTO contact(nom, prenom, age, sexe, date_de_naissance)
VALUES(_nom, _prenom, _age, _sexe, _date_de_naissance);
$$;--Fin de la procedure

--Lancons la PS par un CALL: 

CALL  Ps_insert_data ('Bouchon','damien',25,'M','1983-05-06')

--Que donne le SELECT ? 

select * from contact

-- creation de la procedure avec un UPDATE :

CREATE OR REPLACE PROCEDURE Ps_update_data(_nom text, _prenom text)
                     
LANGUAGE SQL 
as $$ 
UPDATE contact set nom =_nom where prenom=_prenom
$$;

CALL  Ps_update_data ('Bouchon_2','damien')

--Que donne le SELECT ? 

select * from contact

-- creation de la procedure avec un DELETE  :


CREATE OR REPLACE PROCEDURE Ps_delete_data(_nom text)                    
LANGUAGE SQL 
as $$ 
DELETE  from contact where nom =_nom
$$;

CALL  Ps_delete_data ('Bouchon_2')

--Que donne le SELECT ? 

select * from contact