/*
    COUNT> CONTAGEM
    MIN> MINIMO
    MAX> MAXIMO
    SUM> SOMA
    AVG> MEDIA
*/

-- COUNT
USE AdventureWorks2022
GO

SELECT Count(*) FROM Person.Person
-- SELECT TOP 10 * FROM Person.Person
SELECT Count(DISTINCT FirstName) AS CONTADOR FROM Person.Person
-- CONFIRMANDO:
SELECT DISTINCT FirstName FROM Person.Person

SELECT
    Count(*) AS CONTADOR,
    FirstName
FROM Person.Person
GROUP BY FirstName
GO

SELECT
    Count(*) AS CONTADOR,
    FirstName,
    MiddleName
FROM Person.Person
WHERE FirstName = 'Abby' AND MiddleName IS NOT NULL
GROUP BY FirstName, MiddleName
GO

-- MIN e MAX

SELECT MIN(BusinessEntityID) AS [Minimo_BEID] FROM Person.Person
SELECT MAX(BusinessEntityID) AS [Maximo_BEID] FROM Person.Person

SELECT
    MIN(BusinessEntityID) AS MINIMO,
    MIN(ModifiedDate) AS ['Data Modificada']
FROM Person.Person

SELECT
    MAX(BusinessEntityID) as MAXIMO,
    MAX(ModifiedDate) AS ['Data Modificada Max']
FROM Person.Person

SELECT SUM(BusinessEntityID) as SOMA
FROM Person.Person

SELECT TOP 1 * FROM Person.Person
SELECT TOP 1 * FROM HumanResources.Employee

SELECT
    AVG(VacationHours) AS ['Horas Ferias'],
    HRE.Gender
FROM HumanResources.Employee AS HRE
INNER JOIN Person.Person as PP
ON PP.BusinessEntityID = HRE.BusinessEntityID
GROUP BY HRE.Gender


-- SUM e AVG (nao precisam de agregar)

SELECT
    SUM(BusinessEntityID)
FROM Person.Person

SELECT
    AVG(BusinessEntityID)
FROM Person.Person

SELECT
    PP.MiddleName,
    SUM(SalesQuota)
FROM Sales.SalesPerson AS SSP
JOIN Person.Person AS PP
ON SSP.BusinessEntityID = PP.BusinessEntityID
GROUP BY PP.MiddleName

SELECT * FROM HumanResources.Department

SELECT * FROM HumanResources.EmployeeDepartmentHistory
WHERE StartDate = '2009-01-14'

SELECT * FROM HumanResources.EmployeeDepartmentHistory
WHERE StartDate BETWEEN '2001-01-01' AND '2009-01-14'

SELECT
    RateChangeDate,
    SUM(Rate) AS Rate,
    MAX(Rate) AS [MAX],
    COUNT(Rate) AS Count
FROM HumanResources.EmployeePayHistory
GROUP BY RateChangeDate

SELECT
    COUNT(*) AS CONTADOR,
    FirstName
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(*) > 20

SELECT
    RateChangeDate,
    SUM(Rate) as SOMA
FROM HumanResources.EmployeePayHistory
GROUP BY RateChangeDate
HAVING SUM(Rate) > 12 AND SUM(Rate) < 20

-- having busca algo dentro da função de agregação
-- where busca algo dentro de uma variável

-- null nao sao considerados nas chamadas de funcoes de agregação