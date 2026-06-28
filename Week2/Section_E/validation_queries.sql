USE SuperstoreDB;
GO

-- Section E: Data Validation

-- E1. Total number of records
SELECT COUNT(*) AS Total_Rows
FROM Superstore;

-- E2. Check for null values
SELECT
SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Null_Order_ID,
SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Null_Customer_ID,
SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Null_Product_ID,
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit
FROM Superstore;

-- E3. Duplicate Order IDs
SELECT
Order_ID,
COUNT(*) AS Frequency
FROM Superstore
GROUP BY Order_ID
HAVING COUNT(*) > 1
ORDER BY Frequency DESC;

-- E4. Duplicate Customer IDs
SELECT
Customer_ID,
COUNT(*) AS Frequency
FROM Superstore
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY Frequency DESC;

-- E5. Orders with negative sales
SELECT *
FROM Superstore
WHERE Sales < 0;

-- E6. Orders with negative profit
SELECT *
FROM Superstore
WHERE Profit < 0;

-- E7. Orders with highest discount
SELECT *
FROM Superstore
WHERE Discount = (
SELECT MAX(Discount)
FROM Superstore
);

-- E8. Check unique customers
SELECT
COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Superstore;

-- E9. Check unique products
SELECT
COUNT(DISTINCT Product_ID) AS Unique_Products
FROM Superstore;

-- E10. Verify date range
SELECT
MIN(Order_Date) AS First_Order_Date,
MAX(Order_Date) AS Last_Order_Date
FROM Superstore;

-- E11. Verify sales statistics
SELECT
MIN(Sales) AS Minimum_Sales,
MAX(Sales) AS Maximum_Sales,
AVG(Sales) AS Average_Sales
FROM Superstore;

-- E12. Verify profit statistics
SELECT
MIN(Profit) AS Minimum_Profit,
MAX(Profit) AS Maximum_Profit,
AVG(Profit) AS Average_Profit
FROM Superstore;
