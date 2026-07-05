USE SuperstoreDB;
GO

WITH UniqueOrders AS (
    SELECT 
        Row_ID,
        Order_ID,
        Order_Date,
        Ship_Date,
        Ship_Mode,
        Customer_ID,
        Product_ID,
        Sales,
        Quantity,
        Discount,
        Profit,
        -- We partition by Row_ID here, assuming it is your Primary Key
        ROW_NUMBER() OVER(PARTITION BY Row_ID ORDER BY Row_ID) as row_num
    FROM Superstore
)
INSERT INTO orders (Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Product_ID, Sales, Quantity, Discount, Profit)
SELECT 
    Row_ID, 
    Order_ID, 
    Order_Date, 
    Ship_Date, 
    Ship_Mode, 
    Customer_ID, 
    Product_ID, 
    Sales, 
    Quantity, 
    Discount, 
    Profit
FROM UniqueOrders
WHERE row_num = 1;