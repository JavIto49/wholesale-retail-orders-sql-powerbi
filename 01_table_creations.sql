CREATE TABLE Customers (
customerID INT PRIMARY KEY
);

CREATE TABLE Suppliers (
supplierID INT PRIMARY KEY,
supplierCountry VARCHAR(100),
supplierName VARCHAR(100)
);

CREATE TABLE Products (
productID BIGINT PRIMARY KEY,
productLine VARCHAR(100),
productCategory VARCHAR(100),
productGroup VARCHAR(100),
productName VARCHAR(150),
supplierID INT,
FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID)
);

CREATE TABLE Orders (
orderID INT PRIMARY KEY,
customerID INT,
dateOrderPlaced DATE,
deliveryDate DATE,
productID BIGINT,
quantityOrdered INT,
totalRetailPrice DECIMAL(10,2),
costPricePerUnit DECIMAL(10,2),
customerStatus VARCHAR(50),
FOREIGN KEY (customerID) REFERENCES Customers(customerID),
FOREIGN KEY (productID) REFERENCES Products(productID)
);