USE wholesale_retail_db;

-- Insert all distinct customerIDs from orders_raw
INSERT INTO Customers (customerID)
SELECT DISTINCT customerID
FROM orders_raw;

-- Check row count for new Customers table = 56027
SELECT COUNT(*) AS table_rows
FROM Customers

-- Compare raw row count for customerID = 56027 distinct values
SELECT COUNT(DISTINCT customerID) FROM orders_raw;
