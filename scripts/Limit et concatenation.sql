/******************************************************************************
************************  LIMIT,concatenation, et Alias de colonne  ***********
*******************************************************************************/


-- Partons maintenant de cette table avec des insertions multiples, bien sur le script
-- est en attaché dans le cours :)

--- Creation de la table sur lequel on va travailler sur les prochaines sections 

create table Contact (Nom varchar (200),prenom varchar (200), age int, sexe char (1), date_de_naissance date)

insert into contact values 

('Marchand','Elisabeth',18,'F','04-08-1976'),
('Truchon','Melanie',16,'F','04-08-1978'),
('Teslu','Sandrine',17,'F','02-05-1987'),
('Portail','Bruno',23,'M','06-05-1970'),
('Virenque','Michel',22,'M','02-08-1983'),
('Dutruel','Pascal',22,'M','02-08-1983'),-- meme age que Virenque michel
('Virenque','Micheline',37,'M','02-08-1975'),
('Fournillet','Alain',22,'M','01-01-1983'),
('Faurnillet','Pascal',48,'M','12-06-1960'),
('Boutin','Ludivine',47,'F','22-01-1965'),
('Delors','Valerie',28,'M','24-09-1978'),
('Thuillier','olivier',41,'M','12-08-1976'),
('Chuillier','olivier',41,'M','12-08-1976'),
('Meilhac','Amelie',34,'F','08-05-1983'),
('Boutin','Ludivine',47,'F','22-01-1965')-- deux fois la meme valeur dans la table, c'est un doublon

--- Que donne le select ? 

select * from contact

--selectionner juste la premiere ligne

select   * from contact limit 1

--selectionner les cinq premieres lignes

select * from contact limit 5 

-- On peut aussi le combiner avec offset, et qui va faire un saut de ligne 

select * from contact limit 3 offset 12

-- Et si on veut concatener deux champs par exemple nom et prenom ? 

-- Première méthode

select nom || ' ' || prenom as TOTO from contact 

-- Deuxième méthode

select concat(nom, ' ', prenom) as nom from contact 
