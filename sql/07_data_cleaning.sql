USE wholesale_retail_db;

-- Exploring customerStatus category value issues
SELECT customerStatus
FROM Orders;

-- Standardized customerStatus category values
UPDATE Orders
SET customerStatus =
    CASE 
        WHEN UPPER(customerStatus) = 'GOLD' THEN 'Gold'
        WHEN UPPER(customerStatus) = 'PLATINUM' THEN 'Platinum'
        WHEN UPPER(customerStatus) = 'SILVER' THEN 'Silver'
        ELSE customerStatus
    END;

-- Verifying customerStatus categories
SELECT customerStatus, COUNT(*) AS row_count
FROM Orders
GROUP BY customerStatus;

-- Checking for leading/trailing spaces
SELECT DISTINCT customerStatus
FROM Orders
WHERE customerStatus LIKE ' %' OR customerStatus LIKE '% ';

-- Checking for negative values
SELECT *
FROM Orders
WHERE totalRetailPrice < 0 OR quantityOrdered < 0;

-- Checking order date logic
SELECT *
FROM Orders
WHERE deliveryDate < dateOrderPlaced;

