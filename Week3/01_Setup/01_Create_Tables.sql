DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers(
Customer_ID NVARCHAR(50) PRIMARY KEY,
Customer_Name NVARCHAR(50),
Segment NVARCHAR(50),
Country NVARCHAR(50),
City NVARCHAR(50),
State NVARCHAR(50),
Postal_Code INT,
Region NVARCHAR(50));

CREATE TABLE products(
Product_ID NVARCHAR(50) PRIMARY KEY,
Product_Name NVARCHAR(150),
Category NVARCHAR(50),
Sub_Category NVARCHAR(50));

CREATE TABLE orders(
Row_ID SMALLINT PRIMARY KEY,
Order_ID NVARCHAR(50),
Order_Date DATE,
Ship_Date DATE,
Ship_Mode NVARCHAR(50),
Customer_ID NVARCHAR(50),
Product_ID NVARCHAR(50),
Sales FLOAT,
Quantity TINYINT,
Discount FLOAT,
Profit FLOAT,
FOREIGN KEY(Customer_ID) REFERENCES customers(Customer_ID),
FOREIGN KEY(Product_ID) REFERENCES products(Product_ID));