USE wholesale_retail_db;

-- Checking row count
SELECT 
COUNT(*) AS total_rows
FROM orders_raw;

-- Checking orderID duplicates
SELECT 
orderID, 
COUNT(*) AS duplicate_count
FROM orders_raw
GROUP BY orderID
HAVING COUNT(*) > 1;

-- Checking for nulls in key columns
SELECT 
*
FROM orders_raw
WHERE orderID IS NULL OR productID IS NULL;

-- Checking order dates logical order
SELECT 
*
FROM orders_raw
WHERE deliveryDate < dateOrderPlaced;

-- Distinct customer status values check
SELECT 
DISTINCT customerStatus
FROM orders_raw;

/*
FINDINGS:
- 185,013 rows loaded into orders_raw
- orderID appears unique
- no nulls found in orderID/productID
- customerStatus has inconsistent casing
*/