USE SuperstoreDB;
GO

-- Section D: Join Queries

-- D1. Create Customers table

SELECT DISTINCT
    Customer_ID,
    Customer_Name,
    Segment,
    Region
INTO Customers
FROM Superstore;


-- D2. Create Products table

SELECT DISTINCT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
INTO Products
FROM Superstore;


-- D3. Create Orders table

SELECT DISTINCT
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID
INTO Orders
FROM Superstore;


-- D4. INNER JOIN Orders and Customers

SELECT
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region
FROM Orders o
INNER JOIN Customers c
ON o.Customer_ID = c.Customer_ID;


-- D5. INNER JOIN Superstore and Products

SELECT
    s.Order_ID,
    p.Product_Name,
    p.Category,
    s.Sales,
    s.Profit
FROM Superstore s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID;


-- D6. INNER JOIN Orders, Customers and Products

SELECT
    o.Order_ID,
    c.Customer_Name,
    p.Product_Name,
    s.Sales,
    s.Profit
FROM Superstore s
INNER JOIN Orders o
    ON s.Order_ID = o.Order_ID
INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
INNER JOIN Products p
    ON s.Product_ID = p.Product_ID;


-- D7. LEFT JOIN Customers and Orders

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;


-- D8. LEFT JOIN Products and Superstore

SELECT
    p.Product_Name,
    p.Category,
    s.Sales,
    s.Profit
FROM Products p
LEFT JOIN Superstore s
ON p.Product_ID = s.Product_ID;


-- D9. Total sales by customer using JOIN

SELECT
    c.Customer_Name,
    SUM(s.Sales) AS Total_Sales
FROM Superstore s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC;


-- D10. Total sales by category using JOIN

SELECT
    p.Category,
    SUM(s.Sales) AS Total_Sales
FROM Superstore s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC;