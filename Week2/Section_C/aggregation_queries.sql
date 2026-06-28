USE SuperstoreDB;
GO

-- Section C: Aggregation Queries

-- C1. Total sales
SELECT
SUM(Sales) AS Total_Sales
FROM Superstore;

-- C2. Total profit
SELECT
SUM(Profit) AS Total_Profit
FROM Superstore;

-- C3. Average sales
SELECT
AVG(Sales) AS Average_Sales
FROM Superstore;

-- C4. Sales by region
SELECT
Region,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- C5. Profit by region
SELECT
Region,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- C6. Sales by category
SELECT
Category,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- C7. Profit by category
SELECT
Category,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- C8. Average sales by category
SELECT
Category,
AVG(Sales) AS Average_Sales
FROM Superstore
GROUP BY Category
ORDER BY Average_Sales DESC;

-- C9. Quantity sold by category
SELECT
Category,
SUM(Quantity) AS Total_Quantity
FROM Superstore
GROUP BY Category
ORDER BY Total_Quantity DESC;

-- C10. Sales by segment
SELECT
Segment,
SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- C11. Profit by segment
SELECT
Segment,
SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- C12. Average discount by category
SELECT
Category,
AVG(Discount) AS Average_Discount
FROM Superstore
GROUP BY Category
ORDER BY Average_Discount DESC;
