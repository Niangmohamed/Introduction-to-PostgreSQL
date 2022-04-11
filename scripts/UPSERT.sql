/******************************************************************************
********************************  UPSERT  *************************************
*******************************************************************************/

-- L'idée est que lorsque vous insérez une nouvelle ligne dans la table, PostgreSQL met à jour la ligne si elle existe déjà, 
-- sinon, PostgreSQL insère la nouvelle ligne. C'est pourquoi nous appelons l'action est upsert (mise à jour ou insertion).

-- Creation dune table 

CREATE TABLE customers (
   customer_id serial PRIMARY KEY,
   name VARCHAR UNIQUE,
   email VARCHAR NOT NULL,
   active bool NOT NULL DEFAULT TRUE
);

--Insertion de nouvelles lignes

INSERT INTO customers (NAME, email)
VALUES
   ('IBM', 'contact@ibm.com'),
   (
      'Microsoft',
      'contact@microsoft.com'
   ),
   (
      'Intel',
      'contact@intel.com'
   );
   
   -- Que donne le SELECT ? 
   
   select * from customers
   
   -- Insertion de nouvelles 
   
   INSERT INTO customers (NAME, email)
VALUES
   (
      'Microsoft',
      'hotline@microsoft.com'
   ) 
ON CONFLICT ON CONSTRAINT customers_name_key -- Conflit de contrainte on ne fait rien
DO NOTHING;



   -- Que donne le SELECT ? 
   
   select * from customers
   
   -- Pas d'insertion
   
   -- Par contre on peut lui affilier un UPDATE en cas de conflit 
   
   INSERT INTO customers (name, email)
VALUES
   (
      'Microsoft',
      'TITI@microsoft.com'
   ) 
ON CONFLICT (name) 
DO
UPDATE
     SET email = EXCLUDED.email
	 
   -- Que donne le SELECT ? 
   
   select * from customers	 
   
 
   --On peut rajouter aussi une autre adresse email a l'interieur
   
   INSERT INTO customers (name, email)
VALUES
   (
      'Microsoft',
      'hotline@microsoft.com'
   ) 
ON CONFLICT (name) 
DO
      UPDATE
     SET email = EXCLUDED.email || ';' || customers.email;
   
  
   -- Que donne le SELECT ? 
   
   select * from customers	  
 

	 