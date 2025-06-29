-- Top N Products by Price per Category using various Ranking Functions
-- ROW_NUMBER() for unique ranking
WITH ProductRanking AS (
    SELECT pr.ProductID, pr.Name AS ProductTitle, cat.Name AS ProductGroup, pr.ListPrice AS Cost,
           ROW_NUMBER() OVER (PARTITION BY cat.Name ORDER BY pr.ListPrice DESC) AS Position
    FROM [AdventureWorks2022].[Production].[Product] pr
    JOIN [AdventureWorks2022].[Production].[ProductSubcategory] subcat ON pr.ProductSubcategoryID = subcat.ProductSubcategoryID
    JOIN [AdventureWorks2022].[Production].[ProductCategory] cat ON subcat.ProductCategoryID = cat.ProductCategoryID
    WHERE pr.ListPrice > 0)
SELECT * FROM ProductRanking WHERE Position <= 3 ORDER BY ProductGroup, Position;

-- RANK() for handling ties (gaps included)
WITH PriceRankings AS (
    SELECT prod.ProductID, prod.Name AS ProductLabel, cat.Name AS CategoryLabel, prod.ListPrice AS SellingPrice,
           RANK() OVER (PARTITION BY cat.Name ORDER BY prod.ListPrice DESC) AS PricePosition
    FROM [AdventureWorks2022].[Production].[Product] prod
    INNER JOIN [AdventureWorks2022].[Production].[ProductSubcategory] sub ON prod.ProductSubcategoryID = sub.ProductSubcategoryID
    INNER JOIN [AdventureWorks2022].[Production].[ProductCategory] cat ON sub.ProductCategoryID = cat.ProductCategoryID
    WHERE prod.ListPrice > 0)
SELECT * FROM PriceRankings WHERE PricePosition <= 3 ORDER BY CategoryLabel, PricePosition;

-- DENSE_RANK() for tie handling without gaps
WITH DenseRanked AS (
    SELECT item.ProductID, item.Name AS ProductName, category.Name AS CatGroup, item.ListPrice AS Rate,
           DENSE_RANK() OVER (PARTITION BY category.Name ORDER BY item.ListPrice DESC) AS DenseRank
    FROM [AdventureWorks2022].[Production].[Product] item
    LEFT JOIN [AdventureWorks2022].[Production].[ProductSubcategory] subc ON item.ProductSubcategoryID = subc.ProductSubcategoryID
    LEFT JOIN [AdventureWorks2022].[Production].[ProductCategory] category ON subc.ProductCategoryID = category.ProductCategoryID
    WHERE item.ListPrice > 0)
SELECT * FROM DenseRanked WHERE DenseRank <= 3 ORDER BY CatGroup, DenseRank;
