-- =====================================================
-- tables_n_relationships.sql - CORRECTED FOR T-SQL
-- Azure SQL Server - Assignment 3
-- Creates all 5 base tables with proper constraints
-- =====================================================

-- Drop tables if they exist (for re-running)
IF OBJECT_ID('tblPurchaseOrderDetails', 'U') IS NOT NULL DROP TABLE tblPurchaseOrderDetails;
IF OBJECT_ID('tblPurchaseOrders', 'U') IS NOT NULL DROP TABLE tblPurchaseOrders;
IF OBJECT_ID('tblProducts', 'U') IS NOT NULL DROP TABLE tblProducts;
IF OBJECT_ID('tblEmployees', 'U') IS NOT NULL DROP TABLE tblEmployees;
IF OBJECT_ID('tblSuppliers', 'U') IS NOT NULL DROP TABLE tblSuppliers;

-- Table 1: tblSuppliers
-- Stores information about companies that supply products
CREATE TABLE tblSuppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(25)
);

-- Table 2: tblEmployees
-- Stores information about employees who manage inventory
CREATE TABLE tblEmployees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(50)
);

-- Table 3: tblProducts
-- Stores information about each unique product in inventory
CREATE TABLE tblProducts (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(MAX),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    CurrentStock INT DEFAULT 0,
    CONSTRAINT chkCurrentStock CHECK (CurrentStock >= 0)
);

-- Table 4: tblPurchaseOrders
-- Records each purchase order placed with a supplier
CREATE TABLE tblPurchaseOrders (
    PurchaseOrderID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    ExpectedDeliveryDate DATETIME,
    Status VARCHAR(20) DEFAULT 'Ordered',
    CONSTRAINT fkSupplier FOREIGN KEY (SupplierID) REFERENCES tblSuppliers(SupplierID),
    CONSTRAINT fkEmployee FOREIGN KEY (EmployeeID) REFERENCES tblEmployees(EmployeeID)
);

-- Table 5: tblPurchaseOrderDetails
-- Stores the line items (details) for each purchase order
CREATE TABLE tblPurchaseOrderDetails (
    PurchaseOrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    PurchaseOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CostPerUnit DECIMAL(10,2) NOT NULL,
    CONSTRAINT fkPurchaseOrder FOREIGN KEY (PurchaseOrderID) REFERENCES tblPurchaseOrders(PurchaseOrderID),
    CONSTRAINT fkProduct FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID),
    CONSTRAINT chkQuantity CHECK (Quantity > 0),
    CONSTRAINT chkCostPerUnit CHECK (CostPerUnit > 0)
);

