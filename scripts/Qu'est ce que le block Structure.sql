/******************************************************************************
******************   Qu'est ce que le block Structure ? **************************
*******************************************************************************/

-- Qu'est ce que le Block structure ? 
-- Chaque Bloc a deux sections : declaration et corps
-- La Section declaration est facultative, la section de corps est obligatoire

 DO $$ 
<<TOTO>> -- Debut du block 
DECLARE
  counter integer = 0;-- Compteur a 0 
BEGIN -- debut
   counter := counter + 1;-- + 1 
   RAISE NOTICE 'La valeur courante est  %', counter; -- gestion des erreurs,  Comme print en SQL 
END TOTO $$; -- Fin du bloc 

-- Le bloc se termine par un ;
-- Le double $$ est un delimiteur que l'on utilise pour indiquer ou commence et se terminre la definition de la Transaction


-- Allons plus loin,on peut même creer des sous blocs : 

DO $$ 
<<Premier_bloc>>
DECLARE -- 1er bloc
  counter integer := 0;
BEGIN 
   counter := counter + 1;
   RAISE NOTICE 'La valeur courante est %', counter;
 
   DECLARE -- Sous bloc
       counter integer := 0;
   BEGIN 
       counter := counter + 10;
       RAISE NOTICE 'La valeur courante du sous bloc est %', counter;
       RAISE NOTICE 'La valeur courante du premier bloc est %', Premier_bloc.counter;
   END;
 
   RAISE NOTICE 'La valeur courante du premier bloc est %', counter;
   
END Premier_bloc $$;
