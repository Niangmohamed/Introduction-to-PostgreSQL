/*******************************************************************************
**********************    REPLACE, LENGHT et SUBSTRING   ***********************
********************************************************************************/

-- Remplace toutes les occurrences d'une valeur de type chaîne spécifiée par une autre valeur de type chaîne.

-- REPLACE ( string_expression , string_pattern , string_replacement )  


-- Un exemple tout simple 

SELECT REPLACE('salut a vous', 'salut', 'Bonjour');

-- et dans notre table contact ? 

SELECT * FROM Contact 

-- Amusons nous a remplacer la valeur on veut remplacer Sandrine par Tata sandrine

SELECT prenom, REPLACE(prenom, 'Sandrine', 'Tata_sandrine') FROM Contact 


-- LENGHT Retourne le nombre de caractères de l'expression de type chaîne spécifiée

-- et dans notre table contact 

SELECT prenom, length(prenom) as longueur FROM Contact 

-- SUBSTRING permet d'extraire une chaine de caractere a partir de la longueur spécifiée
-- exemple substring(prenom,2,4) va prendre les deux premiers caracteres et va s'arreter au 4eme caractere ensuite


select * from contact

-- si on juste juste les prenoms comme initiale 

select substring(prenom,1,1)as initiale ,prenom  from contact

-- Et si on veut les deux premieres lettres du prenoms et les trois suivantes ? 

select substring(prenom,2,3)as initiale ,prenom  from contact