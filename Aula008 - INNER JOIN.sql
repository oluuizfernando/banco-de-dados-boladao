SELECT TOP 5 * FROM Person.Person
SELECT TOP 5 * FROM Person.EmailAddress
SELECT TOP 5 * FROM Person.PersonPhone

SELECT PP.BusinessEntityID,
    Title,
    FirstName,
    MiddleName,
    LastName,
    EmailAddress,
    PEA.BusinessEntityID,
    PPP.PhoneNumber
FROM Person.Person AS PP
INNER JOIN Person.EmailAddress AS PEA
ON PP.BusinessEntityID = PEA.BusinessEntityID
JOIN Person.PersonPhone as PPP
ON PEA.BusinessEntityID = PPP.BusinessEntityID