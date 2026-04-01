USE wholesale_retail_db;

-- Total Revenue
SELECT 
SUM(totalRetailPrice) AS TotalRevenue
FROM Orders
/* Insights
Total revenue is $25,641,505.45
*/

-- Total Revenue by Customer Status
SELECT 
customerStatus,
SUM(totalRetailPrice) AS TotalRevenue
FROM Orders
GROUP BY customerStatus
ORDER BY TotalRevenue DESC
/* Insights
1.) Revenue is driven almost equally by Silver and Gold customers, with both segments contributing similar order volumes and average spending. 
2.) Platinum customers contribute a very small share of total revenue, suggesting a limited customer base or low engagement among the highest-tier segment.
*/

-- Total Revenue by Product Category
SELECT 
p.productCategory,
SUM(o.totalRetailPrice) AS TotalRevenue
FROM Orders o
JOIN Products p
ON o.productID = p.productID
GROUP BY p.productCategory
ORDER BY TotalRevenue DESC;
/* Insights
1.) Revenue is relatively well distributed across top product categories, with Outdoors and Assorted Sports Articles leading but no single category exceeding a dominant share, 
indicating a diversified revenue base.
2.) There is a sharp drop-off after the top four categories, suggesting that lower-tier categories contribute significantly less and may require optimization or repositioning.
*/

-- Total Revenue by Supplier
SELECT 
s.supplierName,
SUM(o.totalRetailPrice) AS TotalRevenue
FROM Orders o
JOIN Products p
ON o.productID = p.productID
JOIN Suppliers s
ON p.supplierID = s.supplierID
GROUP BY s.supplierName
ORDER BY TotalRevenue DESC;
/* Insights
1.) Eclipse Inc generates more than double the revenue of the next highest supplier, indicating a heavy reliance on a single supplier for revenue generation.
2.) While revenue is distributed across multiple suppliers, the steep drop from the top supplier suggests moderate concentration risk despite overall diversification.
*/

-- Profit
SELECT
SUM(totalRetailPrice) - SUM(quantityOrdered * costPricePerUnit) AS Profit
FROM Orders
/* Insights
1.) The business maintains a profit margin of over 50%, indicating strong cost control and pricing efficiency across its product offerings. 
*/

-- Profit by Product Category
SELECT
p.productCategory,
SUM(o.totalRetailPrice) - SUM(o.quantityOrdered * o.costPricePerUnit) AS Profit
FROM Orders o
JOIN Products p
ON o.productID = p.productID
GROUP BY p.productCategory
ORDER BY Profit DESC
/* Insights
1.) Profit by product category closely mirrors the revenue distribution, with the top four categories generating more than double the profit of lower-performing categories, 
indicating that the business’s strongest revenue drivers are also its strongest profit drivers.
2.) Profit declines gradually after the top categories rather than collapsing into a single dominant category, suggesting the business maintains a relatively diversified profit base across its product mix.
*/

-- Average Order Value
SELECT
ROUND(AVG(totalRetailPrice),2) AS averageOrderValue
FROM Orders
/* Insights
1.) Average order value is $138.59, indicating that the business generates meaningful revenue per transaction without relying solely on very large individual purchases. 
This suggests total revenue is likely supported by a combination of steady transaction volume and moderate basket sizes, rather than unusually high spend per order.
*/

-- Revenue by Order Month
SELECT 
SUM(totalRetailPrice) AS TotalRevenue,
DATENAME(MONTH, dateOrderPlaced) AS MonthName,
YEAR(dateOrderPlaced) AS Year
FROM Orders
GROUP BY 
YEAR(dateOrderPlaced),
MONTH(dateOrderPlaced),
DATENAME(MONTH, dateOrderPlaced)
ORDER BY 
YEAR(dateOrderPlaced),
MONTH(dateOrderPlaced)
/* Insights
1.) Revenue consistently peaks during summer months (June–August) and December, indicating strong seasonal demand patterns driven by outdoor activity and holiday purchasing behavior.
2.) These patterns suggest that marketing and inventory strategies should be aligned with peak demand periods to maximize revenue opportunities.
*/

-- Top 10 Products by Revenue
SELECT 
TOP 10 p.productName,
SUM(o.totalRetailPrice) AS TotalRevenue
FROM Orders o
JOIN Products p
ON o.productID = p.productID
GROUP BY p.productName
ORDER BY TotalRevenue DESC;
/* Insights
1.) Top-performing products are heavily oriented around group and family-oriented use cases, suggesting that social and recreational purchasing behavior is a key driver of revenue.
*/

-- Average Delivery Time by Supplier
SELECT
AVG(DATEDIFF(DAY, o.dateOrderPlaced, o.deliveryDate)) AS AvgDeliveryDays,
s.supplierName
FROM Orders o
JOIN Products p
ON o.productID = p.productID
JOIN Suppliers s
ON p.supplierID = s.supplierID
GROUP BY s.supplierName
ORDER BY AvgDeliveryDays DESC;
/* Insights
1.) Average delivery times across all suppliers remain consistently low (0–1 days), indicating highly efficient fulfillment operations with no apparent supplier bottlenecks.
*/
