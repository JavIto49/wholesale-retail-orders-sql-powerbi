USE wholesale_retail_db;

-- Insert orders data from orders_raw into Orders table
INSERT INTO Orders (
    orderID,
    customerID,
    dateOrderPlaced,
    deliveryDate,
    productID,
    quantityOrdered,
    totalRetailPrice,
    costPricePerUnit,
    customerStatus
)
SELECT 
    orderID,
    customerID,
    dateOrderPlaced,
    deliveryDate,
    productID,
    quantityOrdered,
    totalRetailPrice,
    costPricePerUnit,
    customerStatus
FROM orders_raw;

-- Check row count for new Orders table = 185013
SELECT COUNT(*) AS table_rows
FROM Orders

-- Compare raw row count for orderID = 185013 distinct values
SELECT COUNT(DISTINCT orderID) FROM orders_raw;

