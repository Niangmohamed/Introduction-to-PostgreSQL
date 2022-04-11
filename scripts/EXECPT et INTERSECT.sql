
/*******************************************************************************
***************************  INTERSECT et EXECPT   *****************************
********************************************************************************/

----- Deux tables simples

SELECT ProductID   
FROM Production.Product
GO
SELECT ProductID   
FROM Production.WorkOrder
GO
------- INTERSECT VS JOIN 

SELECT ProductID   
FROM Production.Product  
INTERSECT  
SELECT ProductID   
FROM Production.WorkOrder ;

SELECT  distinct b.ProductID   
FROM Production.Product  C
join Production.WorkOrder B on B.ProductID=C.ProductID where  C.ProductID is not null

------- EXCEPT VS LEFT JOIN VS NOT IN

SELECT ProductID   
FROM Production.Product  
EXCEPT
SELECT ProductID   
FROM Production.WorkOrder 
order by 1 asc
GO

-- et en NOT IN ? 

SELECT C.ProductID   
FROM Production.Product C where C.ProductID not in (select B.productid from  Production.WorkOrder B )
order by 1 asc
