USE wholesale_retail_db;

-- Preview of Suppliers table before inserting
SELECT DISTINCT 
supplierID,
supplierCountry,
supplierName
FROM product_supplier_raw
ORDER BY supplierID ASC

-- Insert split supplier data from product_supplier_raw into Suppliers table
INSERT INTO Suppliers (supplierID, supplierCountry, supplierName)
SELECT DISTINCT 
supplierID,
supplierCountry,
supplierName
FROM product_supplier_raw;

-- Check row count for new Suppliers table = 64 rows
SELECT
COUNT(*) AS table_rows
FROM Suppliers;

-- Compare raw row count for supplierID = 64 distinct values
SELECT COUNT(DISTINCT supplierID) FROM product_supplier_raw;

-- Preview of Suppliers table before inserting
SELECT DISTINCT 
productID,
productLine,
productCategory,
productGroup,
productName,
supplierID
FROM product_supplier_raw
ORDER BY productID ASC

SELECT MAX(productID) AS max_product_id
FROM product_supplier_raw;

-- Insert split product data from product_supplier_raw into Products table
INSERT INTO Products (productID,productLine,productCategory,productGroup,productName,supplierID)
SELECT DISTINCT 
productID,
productLine,
productCategory,
productGroup,
productName,
supplierID
FROM product_supplier_raw;

-- Check row count for new Products table = 5504
SELECT COUNT(*) AS table_rows
FROM Products;

-- Compare raw row count for productID = 5504
SELECT COUNT(DISTINCT productID) AS distinct_products
FROM product_supplier_raw;
