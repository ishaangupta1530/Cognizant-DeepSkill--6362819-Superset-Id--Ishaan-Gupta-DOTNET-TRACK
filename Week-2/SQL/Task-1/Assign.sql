-- 1. Assigning a unique row number to each product within its category based on price
WITH RankedProducts AS (
    SELECT 
        p.ProductID,
        p.Name AS ProductName,
        pc.Name AS Category,
        p.ListPrice AS Price,
        ROW_NUMBER() OVER (PARTITION BY pc.Name ORDER BY p.ListPrice DESC) AS RowNum
    FROM 
        [AdventureWorks2022].[Production].[Product] p
        INNER JOIN [AdventureWorks2022].[Production].[ProductSubcategory] psc 
            ON p.ProductSubcategoryID = psc.ProductSubcategoryID
        INNER JOIN [AdventureWorks2022].[Production].[ProductCategory] pc 
            ON psc.ProductCategoryID = pc.ProductCategoryID
    WHERE 
        p.ListPrice > 0
)
-- Displaying the top 3 most expensive items in each category
SELECT *
FROM RankedProducts
WHERE RowNum <= 3
ORDER BY Category, RowNum;

-- 2. Ranking products with consideration for price ties within each category
WITH RankedProducts AS (
    SELECT 
        p.ProductID,
        p.Name AS ProductName,
        pc.Name AS Category,
        p.ListPrice AS Price,
        RANK() OVER (PARTITION BY pc.Name ORDER BY p.ListPrice DESC) AS PriceRank
    FROM 
        [AdventureWorks2022].[Production].[Product] p
        INNER JOIN [AdventureWorks2022].[Production].[ProductSubcategory] psc 
            ON p.ProductSubcategoryID = psc.ProductSubcategoryID
        INNER JOIN [AdventureWorks2022].[Production].[ProductCategory] pc 
            ON psc.ProductCategoryID = pc.ProductCategoryID
    WHERE 
        p.ListPrice > 0
)
-- Fetching products that rank in the top 3 per category (ties included)
SELECT *
FROM RankedProducts
WHERE PriceRank <= 3
ORDER BY Category, PriceRank;

-- 3. Using DENSE_RANK() to ensure consecutive ranks despite price ties
WITH RankedProducts AS (
    SELECT 
        p.ProductID,
        p.Name AS ProductName,
        pc.Name AS Category,
        p.ListPrice AS Price,
        DENSE_RANK() OVER (PARTITION BY pc.Name ORDER BY p.ListPrice DESC) AS DensePriceRank
    FROM 
        [AdventureWorks2022].[Production].[Product] p
        INNER JOIN [AdventureWorks2022].[Production].[ProductSubcategory] psc 
            ON p.ProductSubcategoryID = psc.ProductSubcategoryID
        INNER JOIN [AdventureWorks2022].[Production].[ProductCategory] pc 
            ON psc.ProductCategoryID = pc.ProductCategoryID
    WHERE 
        p.ListPrice > 0
)
-- Listing products that fall into the top 3 dense ranks for each category
SELECT *
FROM RankedProducts
WHERE DensePriceRank <= 3
ORDER BY Category, DensePriceRank;
