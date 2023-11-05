USE AdventureWorks2022
GO

/*
    PARSE (Nome_da_coluna AS [data_type] [USING culture])
    TRY_PARSE
*/

SELECT (SELECT PARSE('3654' AS INT)) + (SELECT PARSE('3654' AS INT))

SELECT TRY_PARSE('46184F' AS INT)

SELECT PARSE('R$ 360,00' AS SMALLMONEY USING 'pt-BR')
SELECT TRY_PARSE('R$360,00' AS INT USING 'pt-BR')

SELECT
    BusinessEntityID,
    Title,
    FirstName,
    MiddleName,
    LastName,
    ModifiedDate,
    TRY_CAST(ModifiedDate AS DATE) AS DataModificada,
    TRY_CONVERT(VARCHAR(10), ModifiedDate, 3) AS DataMOdificada2
    -- TRY_PARSE(ModifiedDate AS DATE USING 'en-US') AS DataMOdificada3
FROM Person.Person

SELECT PARSE('16/04/1991' AS DATE USING 'pt-BR')

SELECT PARSE('12/16/2021' AS DATE USING 'en-US')
SELECT CAST('11/30/2010' AS DATETIME)
SELECT PARSE('11/30/2010' AS DATE USING 'en-US')

SELECT TRY_CONVERT(MONEY, 35431513, 2)