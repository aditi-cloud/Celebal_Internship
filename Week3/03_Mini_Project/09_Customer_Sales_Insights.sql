WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT TOP 5 c.Customer_Name,cs.TotalSales
FROM CustomerSales cs JOIN customers c ON cs.Customer_ID=c.Customer_ID
ORDER BY TotalSales DESC;

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT TOP 5 c.Customer_Name,cs.TotalSales
FROM CustomerSales cs JOIN customers c ON cs.Customer_ID=c.Customer_ID
ORDER BY TotalSales;

SELECT c.Customer_Name,COUNT(DISTINCT Order_ID) TotalOrders
FROM orders o JOIN customers c ON o.Customer_ID=c.Customer_ID
GROUP BY c.Customer_Name
HAVING COUNT(DISTINCT Order_ID)=1;

WITH CustomerSales AS(
SELECT Customer_ID,SUM(Sales) TotalSales FROM orders GROUP BY Customer_ID)
SELECT c.Customer_Name,cs.TotalSales
FROM CustomerSales cs JOIN customers c ON cs.Customer_ID=c.Customer_ID
WHERE TotalSales>(SELECT AVG(TotalSales) FROM CustomerSales);

SELECT c.Customer_Name,MAX(o.Sales) HighestOrderValue
FROM orders o JOIN customers c ON o.Customer_ID=c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY HighestOrderValue DESC;