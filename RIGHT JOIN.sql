USE AdventureWorks2022
GO

-- SELECT * FROM Sales.SalesPerson -- 17


-- Manteve 17 linhas, porque usei o JOIN (Ou innner join)
-- logo ele manteve o que é intersecção entre as 2 tabelas
SELECT
    SSP.BusinessEntityID AS [SSP.BusinessEntityID],
    PP.BusinessEntityID AS [PP.BusinessEntityID],
    TerritoryID,
    SalesQuota,
    Bonus,
    SalesLastYear,
    FirstName,
    MiddleName,
    LastName
FROM Sales.SalesPerson AS SSP
JOIN Person.Person AS PP
ON SSP.BusinessEntityID = PP.BusinessEntityID


SELECT
    SSP.BusinessEntityID AS [SSP.BusinessEntityID],
    PP.BusinessEntityID AS [PP.BusinessEntityID],
    TerritoryID,
    SalesQuota,
    Bonus,
    SalesLastYear,
    FirstName,
    MiddleName,
    LastName,
    EmailAddress
FROM Sales.SalesPerson AS SSP
RIGHT JOIN Person.Person AS PP
ON SSP.BusinessEntityID = PP.BusinessEntityID
RIGHT JOIN Person.EmailAddress as PEA
ON PEA.BusinessEntityID = PP.BusinessEntityID
ORDER BY SSP.BusinessEntityID,
    PP.BusinessEntityID
    