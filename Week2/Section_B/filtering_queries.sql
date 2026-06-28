USE SuperstoreDB;
GO

-- Section B: Filtering Queries

-- B1. Orders from West region
SELECT *
FROM Superstore
WHERE Region = 'West';

-- B2. Orders from East region
SELECT *
FROM Superstore
WHERE Region = 'East';

-- B3. Technology category orders
SELECT *
FROM Superstore
WHERE Category = 'Technology';

-- B4. Furniture category orders
SELECT *
FROM Superstore
WHERE Category = 'Furniture';

-- B5. Orders with sales greater than 1000
SELECT *
FROM Superstore
WHERE Sales > 1000;

-- B6. Orders with profit greater than 500
SELECT *
FROM Superstore
WHERE Profit > 500;

-- B7. Orders with negative profit
SELECT *
FROM Superstore
WHERE Profit < 0;

-- B8. Orders with discount greater than 20%
SELECT *
FROM Superstore
WHERE Discount > 0.20;

-- B9. Orders placed during 2017
SELECT *
FROM Superstore
WHERE YEAR(Order_Date) = 2017;

-- B10. Technology orders from West region
SELECT *
FROM Superstore
WHERE Region = 'West'
AND Category = 'Technology';

-- B11. Furniture orders with sales above 500
SELECT *
FROM Superstore
WHERE Category = 'Furniture'
AND Sales > 500;

-- B12. Office Supplies orders with discount
SELECT *
FROM Superstore
WHERE Category = 'Office Supplies'
AND Discount > 0;
