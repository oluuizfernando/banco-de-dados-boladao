/*
    SCHEMA - Maneira de organizar tabelas, ajuda a estruturar a base.
    Pois o agrupamento faz voce ter mais controle e ate segurança.
    Ao colocar restrição de acessos a um usuário por exemplo, se voce quiser
    restringir um usuário a acessar determinados dados voce consegue através do schema.
*/

SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Person'
AND TABLE_NAME = 'Person'

-- se estou na master posso usar também:

USE AdventureWorks2022
GO

SELECT * FROM Person.Person
WHERE BusinessEntityID > 500

-- Ou também

SELECT * FROM AdventureWorks2022.Sales.Store

-- SELECT * FROM [NOME_BASE].[NOME_SCHEMA].[NOME_TABELA]

SELECT * FROM [INFORMATION_SCHEMA].[COLUMNS]
WHERE [TABLE_SCHEMA] = 'Person'
AND [TABLE_NAME] = 'Person'