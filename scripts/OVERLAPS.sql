/******************************************************************************
***************        OVERLAPS et GENERATE_SERIES   **************************
*******************************************************************************/

-- OVERLAPS est une fonction tres utile qui permet de voir que deux dates se chevauchent 
-- Overlaps veut dire chevauchement en anglais

select 
        ('2019-02-10'::date, '2019-02-15'::date)
	OVERLAPS 
        ('2019-02-16'::date, '2019-02-18'::date)

-- Generate series permet de generer des series a la volée:  


SELECT * FROM generate_series(2,4);

-- Dans l'autre sens : 

SELECT * FROM generate_series(5,1,-2)

-- On peut le generer aussi pour des dates :

select * from generate_series ('2019-10-10'::timestamp,'2019-10-11'::timestamp,'1 hour')