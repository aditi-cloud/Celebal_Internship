USE SuperstoreDB;
GO

WITH UniqueProducts AS (
    SELECT 
        Product_ID, 
        Product_Name, 
        Category, 
        Sub_Category,
        -- Assigns a sequential number to every instance of a Product_ID
        ROW_NUMBER() OVER(PARTITION BY Product_ID ORDER BY Product_ID) as row_num
    FROM Superstore
)
INSERT INTO products (Product_ID, Product_Name, Category, Sub_Category)
SELECT 
    Product_ID, 
    Product_Name, 
    Category, 
    Sub_Category
FROM UniqueProducts
-- Filters out all duplicates and variations, keeping only the first one
WHERE row_num = 1;