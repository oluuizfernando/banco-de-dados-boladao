SELECT DISTINCT
    BusinessEntityID,
    -- PersonType,
    -- Title,
    FirstName,
    MiddleName,
    LastName
   -- ModifiedDate
FROM Person.Person
ORDER BY LastName
OFFSET 50 ROWS
FETCH NEXT 10 ROWS ONLY