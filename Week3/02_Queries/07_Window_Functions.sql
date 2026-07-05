USE SuperstoreDB;
GO

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT Customer_ID,TotalSales,RANK() OVER(ORDER BY TotalSales DESC) SalesRank
FROM CustomerSales;

SELECT Customer_ID,Order_ID,Sales,
ROW_NUMBER() OVER(PARTITION BY Customer_ID ORDER BY Sales DESC) RowNumber
FROM orders;

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT * FROM(
SELECT Customer_ID,TotalSales,RANK() OVER(ORDER BY TotalSales DESC) Ranking
FROM CustomerSales)x
WHERE Ranking<=3;