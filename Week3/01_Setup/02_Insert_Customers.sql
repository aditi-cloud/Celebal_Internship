WITH UniqueCustomers AS (
    SELECT 
        Customer_ID, 
        Customer_Name, 
        Segment, 
        Country, 
        City, 
        State, 
        Postal_Code, 
        Region,
        -- This assigns a row number to each record for a customer. 
        -- If a customer has 3 addresses, they get rows 1, 2, and 3.
        ROW_NUMBER() OVER(PARTITION BY Customer_ID ORDER BY Customer_ID) as row_num
    FROM Superstore
)
INSERT INTO customers (Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region)
SELECT 
    Customer_ID, 
    Customer_Name, 
    Segment, 
    Country, 
    City, 
    State, 
    Postal_Code, 
    Region
FROM UniqueCustomers
-- This ensures we only grab the first record for every unique customer ID
WHERE row_num = 1;