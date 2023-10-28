/*
1 - [x]  Consultar todos os lastname distintos
2 - [x]  Consultar dos 50 a 100 de pessoas na lista
3 - [x]  Consultar na base os top 10 de data de modificação mais recente
4 - [x]  Consultar os PersonType distintos

**HumanResources.Employee**

5 - [x]  Consultar quantas linhas tem
6 - [x]  Consultar a soma por gênero de horas de férias
7 - [x]  Consultar os 10 primeiros JobTitle com mais horas de SickLeave
8 - [x]  Fazer um merge com Persons.Persons e descobrir o nome dos 3 primeiros com mais horas de férias
*/

--1
SELECT DISTINCT
    LastName
FROM Person.Person

--2
SELECT TOP 50
    FirstName
FROM Person.Person

--3
SELECT TOP 10
    BusinessEntityID AS [Entidade ID],
    FirstName AS [Primeiro Nome],
    ModifiedDate as [Data de Modificação]
FROM Person.Person
ORDER BY ModifiedDate DESC

--4
SELECT DISTINCT
    PersonType AS [Tipo Pessoa],
    FirstName AS [Primeiro Nome]
FROM Person.Person

--SELECT * FROM HumanResources.Employee

-- HumanResources.Employee
--5
SELECT * FROM HumanResources.Employee

--6
SELECT
    Gender AS [Gênero],
    SUM(VacationHours) AS [Horas Férias SOMA]
FROM
    HumanResources.Employee
GROUP BY GENDER
ORDER BY 1 DESC

--7
SELECT TOP 10
    JobTitle,
    SickLeaveHours
FROM
    HumanResources.Employee
ORDER BY SickLeaveHours DESC

--8
SELECT TOP 3
    FirstName,
    db2.VacationHours
FROM Person.Person AS db1
INNER JOIN HumanResources.Employee as db2
ON db1.BusinessEntityID = db2.BusinessEntityID
ORDER BY VacationHours DESC