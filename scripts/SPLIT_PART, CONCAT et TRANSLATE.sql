/*******************************************************************************
**********************    SPLIT_PART, CONCAT et TRANSLATE   ********************
********************************************************************************/

-- Va chercher la valeur dans le tableau proposé: 

SELECT SPLIT_PART('A,B,C', ',', 2)

-- CONCAT va concatener une chaine de caractere 

SELECT concat('w',3,'r', 'esource','.','com');

-- La fonction translate () de PostgreSQL est utilisée pour traduire n'importe quel caractère de la chaîne par un caractère dans replace_string

SELECT translate('translate', 'rnlt', '123')

-- https://w3resource.com/PostgreSQL/translate-function.php