USE SuperstoreDB;
GO

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT c.Customer_Name,cs.TotalSales,
RANK() OVER(ORDER BY cs.TotalSales DESC) CustomerRank
FROM CustomerSales cs
JOIN customers c
ON cs.Customer_ID=c.Customer_ID
ORDER BY CustomerRank;