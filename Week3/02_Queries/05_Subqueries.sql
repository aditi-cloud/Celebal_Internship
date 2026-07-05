USE SuperstoreDB;
GO

SELECT * FROM orders WHERE Sales>(SELECT AVG(Sales) FROM orders);

SELECT * FROM orders o
WHERE Sales=(SELECT MAX(Sales) FROM orders WHERE Customer_ID=o.Customer_ID)
ORDER BY Customer_ID;