USE SuperstoreDB;
GO

-- Section A: Basic Queries

-- A1. Check total number of records
SELECT COUNT(*) AS Total_Rows
FROM Superstore;

-- A2. View first 10 records
SELECT TOP 10 *
FROM Superstore;

-- A3. View table schema
SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstore';

-- A4. List all regions
SELECT DISTINCT Region
FROM Superstore
ORDER BY Region;

-- A5. List all categories
SELECT DISTINCT Category
FROM Superstore
ORDER BY Category;

-- A6. List all segments
SELECT DISTINCT Segment
FROM Superstore
ORDER BY Segment;

-- A7. List all ship modes
SELECT DISTINCT Ship_Mode
FROM Superstore
ORDER BY Ship_Mode;

-- A8. Total number of customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Superstore;

-- A9. Total number of products
SELECT COUNT(DISTINCT Product_ID) AS Total_Products
FROM Superstore;

-- A10. Date range of the dataset
SELECT
MIN(Order_Date) AS First_Order,
MAX(Order_Date) AS Last_Order
FROM Superstore;
