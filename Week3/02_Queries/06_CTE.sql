USE SuperstoreDB;
GO

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT * FROM CustomerSales;

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT * FROM CustomerSales
WHERE TotalSales>(SELECT AVG(TotalSales) FROM CustomerSales);