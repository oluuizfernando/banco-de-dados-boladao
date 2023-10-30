USE AdventureWorks2022
GO

SELECT
    SSP.BusinessEntityID,
    PP.BusinessEntityID,
    FirstName,
    TerritoryID,
    Bonus,
    SalesLastYear
FROM Sales.SalesPerson AS SSP
FULL OUTER JOIN Person.Person AS PP
ON SSP.BusinessEntityID = PP.BusinessEntityID

SELECT
    PP.BusinessEntityID AS [PP.BusinessEntityID],
    SSP.BusinessEntityID AS [SPP.BusinessEntityID],
    Title,
    FirstName,
    MiddleName,
    LastName,
    PEA.EmailAddress,
    PEA.BusinessEntityID AS [PEA.BusinessEntityID],
    HRE.BusinessEntityID as [HRE.BusinessEntityID],
    HRE.Gender,
    HRE.LoginID
FROM Person.Person as PP
FULL OUTER JOIN Person.EmailAddress AS PEA
ON PP.BusinessEntityID = PEA.BusinessEntityID

FULL OUTER JOIN HumanResources.Employee as HRE
ON PEA.BusinessEntityID = HRE.BusinessEntityID

FULL OUTER JOIN Sales.SalesPerson as SSP
ON HRE.BusinessEntityID = PEA.BusinessEntityID

-- É importante a ordem como você coloca os joins para dar mais matchs com valores
-- Isto é, sempre colocar os que têm maior numero de linhas primeiro
-- Tanto em ordem, quanto também no ON quanto for fechar as chaves, exemplo abaixo:

/*
    Antes tava assim:

    FULL OUTER JOIN Sales.SalesPerson as SSP
    ON HRE.BusinessEntityID = SSP.BusinessEntityID
    
    -> Resultando em 19000 linhas

    FULL OUTER JOIN Sales.SalesPerson as SSP
    ON HRE.BusinessEntityID = PEA.BusinessEntityID (ou PP.BusinessEntityID)

    -> Resultando em 24000 linhas

    Qual a diferença?

    SSP tem menos linhas que PEA ou PP (que tem a mesma quantidade de linhas, por isso tanto faz um ou o outro)
        Dessa forma, resultava em menos linhas pois a base que estava sendo usada para dar match com as chaves
    tinha menos linhas. Para resolver, foi trocado por uma base com mais linhas. O segredo não é a quantidade de linhas
    propriamente ditas, mas sim, se o contexto das bases correspondem e ajudam a resolver o problema.
*/