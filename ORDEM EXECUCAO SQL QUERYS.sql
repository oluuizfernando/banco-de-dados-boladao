USE AdventureWorks2022
GO

SELECT
    SalesOrderID,
    SalesOrderDetailID,
    CarrierTrackingNumber,
    OrderQty,
    ProductID,
    UnitPrice,
    LineTotal,
    TRY_CAST(ModifiedDate AS DATE) AS [DataModificada]
FROM Sales.SalesOrderDetail
    -- Esse codigo vai dar erro, porque o SELECT executa bem depois do WHERE
    -- Então no SELECT nós convertemos para DATA
    -- Mas no WHERE não
WHERE ModifiedDate = '2011-05-31'
GO

SELECT
    SalesOrderID,
    SalesOrderDetailID,
    CarrierTrackingNumber,
    OrderQty,
    ProductID,
    UnitPrice,
    LineTotal,
    /*
        Não vai acontecer porque na hora de executar ele vai ver que
        nao tem nada no GROUP BY. E o SELECT so vem depois
    */
    -- MAX(OrderQty) as CDL,
    TRY_CAST(ModifiedDate AS DATE) AS [DataModificada]
FROM Sales.SalesOrderDetail
    -- 
WHERE CarrierTrackingNumber IS NOT NULL
GO

/*
    Ordem de processamento lógico da Query
    1. FROM ->(sem mencionar o FROM, ele nem te da a opçao de autocomplete)
    2. WHERE -> Aí ele vai avaliar se a condição é verdadeira, se não for, vai ser tudo em branco
    3. GROUP BY -> Usamos quando temos uma função de AGG no SELECT, mas ainda nao to no SELECT
    4. HAVING -> 
    5. SELECT -> 
    6. ORDER BY -> 
*/