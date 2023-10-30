/*
SELECT *
	FROM Person.Person
	WHERE FirstName = 'Pete'
*/

SELECT BusinessEntityID, PersonType, Title, FirstName, MiddleName, LastName, ModifiedDate
FROM Person.Person
WHERE FirstName = 'Ken'
AND MiddleName = 'L'
