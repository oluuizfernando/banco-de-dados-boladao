USE AdventureWorks2022
GO

-- SELECT * FROM Person.Person -- 19.972

SELECT PP.BusinessEntityID AS [PP.BusinessEntityID],
    HRE.BusinessEntityID AS [HRE.BusinessEntityID],
    FirstName,
    MiddleName,
    LastName,
    LoginID,
    JobTitle,
    BirthDate
FROM Person.person as PP
LEFT JOIN HumanResources.Employee HRE
ON PP.BusinessEntityID = HRE.BusinessEntityID
ORDER BY PP.BusinessEntityID


SELECT * FROM HumanResources.Employee -- 290