USE wholesale_retail_db;

-- Checking row count
SELECT 
COUNT(*) AS total_rows
FROM product_supplier_raw;

-- Checking productID duplicates
SELECT 
productID, 
COUNT(*) AS duplicate_count
FROM product_supplier_raw
GROUP BY productID
HAVING COUNT(*) > 1;

-- Checking supplierID duplicates
SELECT 
supplierID, 
COUNT(*) AS duplicate_count
FROM product_supplier_raw
GROUP BY supplierID
HAVING COUNT(*) > 1;

-- Checking for nulls in key columns
SELECT 
*
FROM product_supplier_raw
WHERE productID IS NULL OR supplierID IS NULL;

-- Distinct customer status values check
SELECT 
DISTINCT supplierCountry
FROM product_supplier_raw;

-- Check whether any supplierID maps to more than one supplierName
SELECT supplierID, COUNT(DISTINCT supplierName)
FROM product_supplier_raw
GROUP BY supplierID
HAVING COUNT(DISTINCT supplierName) > 1;

-- Check whether any supplierID maps to more than one supplierCountry
SELECT supplierID, COUNT(DISTINCT supplierCountry)
FROM product_supplier_raw
GROUP BY supplierID
HAVING COUNT(DISTINCT supplierCountry) > 1;