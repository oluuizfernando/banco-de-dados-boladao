/*
    ALL (subquery)
    AND
    OR
    SOME | ANY (subquery)
    BETWEEN
    EXISTS (subquery)
    IN | NOT IN
    LIKE | NOT LIKE
*/

-- AND & OR - E & Ou
SELECT * FROM Person.Person
WHERE BusinessEntityID > 150
AND FirstName <> 'Lane'
AND FirstName <> 'Aaron'
ORDER BY FirstName

-- BETWEEN -> ENTRE
SELECT * FROM Person.Person
    WHERE BusinessEntityID BETWEEN 600 AND 800
    -- AND (MiddleName = 'DevDojo' OR MiddleName = 'G' OR LastName = 'Boladao')

SELECT * FROM Person.Person
WHERE BusinessEntityID IN (1, 2, 3, 4, 659, 580, 900, 4500)

SELECT * FROM Person.Person
WHERE FirstName NOT IN ('Ken', 'Gigi', 'Aaron')

SELECT * FROM Person.Person
-- WHERE FirstName LIKE 'G%' <- Começa com G
-- WHERE FirstName LIKE 'G__a' <- Começa com G, termina com a e tenha 4 letras
WHERE FirstName LIKE '[ABCDEFG]___a'  -- A primeira letra esteja no intervalo de A a G

SELECT * FROM Person.Person
WHERE FirstName NOT LIKE '[ABCDEFG]___a'

SELECT * FROM Person.Person
WHERE FirstName LIKE '^[ABCDEFG]___a'