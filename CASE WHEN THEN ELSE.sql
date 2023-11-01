USE AdventureWorks2022
GO

SELECT 
    BusinessEntityID,
    PersonType,
    NameStyle,
    Title,

    CASE Title
        WHEN 'Mr.' THEN 'Senhor'
        WHEN 'Ms.' THEN 'Senhora'
        ELSE ''
    END AS TITULO,

    FirstName,
    MiddleName,
    LastName,

    FirstName + ' ' + MiddleName + ' ' + LastName AS [NOME_COMPLETO],

    ModifiedDate
FROM Person.Person

SELECT * FROM Person.EmailAddress
SELECT * FROM Person.PersonPhone
SELECT * FROM Person.PhoneNumberType

SELECT 
    PP.BusinessEntityID,
    LoginID,
    OrganizationLevel,
    JobTitle,
    BirthDate,
    CASE MaritalStatus
        WHEN 'M' THEN 'Casado'
        WHEN 'S' THEN 'Solteiro'
        ELSE ''
    END AS [Estado Civil],
    CASE Gender
        WHEN 'M' THEN 'Masculino'
        WHEN 'F' THEN 'Feminino'
        ELSE ''
    END AS [Estado Civil],
    PersonType,
    NameStyle,
    Title,
    FirstName,
    MiddleName,
    LastName,
    Rate,
    CASE Rate
        WHEN Rate < 12.000 THEN ['Salário Minimo']
        WHEN Rate BETWEEN 12.000 AND 20.000 THEN ['EMPRESÁRIO']
        WHEN RATE > 20.000 THEN ['MILIONÁRIO']
        ELSE 'Desempregado'
    END AS ['COMPARACAO REAL'],
    CASE
        WHEN Rate < 12.000 THEN (Rate * 2)
        WHEN Rate BETWEEN 12.000 AND 20.000 (Rate * 1.1)
        WHEN RATE > 20.000 THEN (Rate * 0.1)
        ELSE RATE * 1
    END AS ['COMPARACAO NUMERAL'],
    PayFrequency,
    PEA.EmailAddress,
    PPP.PhoneNumber,
    PPP.PhoneNumberTypeID,
    FirstName + ' ' + MiddleName + ' ' + LastName AS [NOME_COMPLETO]
FROM Person.Person AS PP
JOIN Person.EmailAddress as PEA
ON PP.BusinessEntityID = PEA.BusinessEntityID
JOIN Person.PersonPhone as ppp
ON PP.BusinessEntityID = PPP.BusinessEntityID
LEFT JOIN HumanResources.Employee as HRE
ON HRE.BusinessEntityID = PP.BusinessEntityID
LEFT JOIN HumanResources.EmployeePayHistory as HREPH
ON HREPH.BusinessEntityID = PP.BusinessEntityID