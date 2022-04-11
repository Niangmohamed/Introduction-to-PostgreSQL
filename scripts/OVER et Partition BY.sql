/*******************************************************************************
************** La clause OVER  et PARTITION BY  ********************************
********************************************************************************/

-- Dans notre table nous avons trois personnes qui ont 22 ans,et aussi deux personnes qui en ont 41, et deux qui en ont 47

select * from contact 

--Alors comment les numéroter ? 


SELECT * ,
	row_number() over (order by age) as rownumber
FROM contact


-- On voit que les lignes sont numérotées.
-- On peut mettre un DESC dans l'ORDER BY 

SELECT * ,
	ROW_NUMBER() OVER( ORDER BY age desc) AS RowNum
FROM contact

-- Utilisons deux colonnes pour l'order BY :

SELECT * ,
	ROW_NUMBER() OVER( ORDER BY age,date_de_naissance desc) AS RowNum
FROM contact

-- Rajoutons le PARTITION BY : 

SELECT * ,
	ROW_NUMBER() OVER(PARTITION BY age ORDER BY age) AS RowNum
FROM contact

-- On voit 1,2,3 sur l'age 22
-- 1,2 sur l'age 41
-- 1,2 sur l'age 47

-- Et si je mets plusieurs colonnes dans le PARTITION BY ? 

SELECT * ,
	ROW_NUMBER() OVER(PARTITION BY age,date_de_naissance ORDER BY age) AS RowNum
FROM contact


