-- =====================================================
-- DataBasePrompts.sql - CORRECTED FOR T-SQL
-- Azure SQL Server - Assignment 3
-- 10 Business Processes with CRUD operations & advanced queries

PRINT '';
PRINT '--- PROCESS 1: Add New Supplier ---';

INSERT INTO tblSuppliers (SupplierName, ContactPerson, Email, Phone) 
VALUES ('Tech Supply Corp', 'Michael Brown', 'michael@techsupply.com', '555-0104');

SELECT SupplierID, SupplierName, ContactPerson, Email, Phone 
FROM tblSuppliers 
WHERE SupplierName = 'Tech Supply Corp';

PRINT '✅ Process 1 Complete: New supplier added';


-- PROCESS 2: Add New Product to Inventory (INSERT)
PRINT '';
PRINT '--- PROCESS 2: Add New Product to Inventory ---';

INSERT INTO tblProducts (ProductName, Description, Brand, Model, CurrentStock) 
VALUES ('USB-C Hub', 'Multi-port USB-C hub with 7 ports', 'TechLink', 'TL-USB7', 0);

SELECT ProductID, ProductName, Description, Brand, Model, CurrentStock 
FROM tblProducts 
WHERE ProductName = 'USB-C Hub';

PRINT '✅ Process 2 Complete: New product added';


-- PROCESS 3: Create New Employee Account (INSERT)
PRINT '';
PRINT '--- PROCESS 3: Create New Employee Account ---';

INSERT INTO tblEmployees (FirstName, LastName, Role) 
VALUES ('Carol', 'Martinez', 'Procurement Officer');

SELECT EmployeeID, FirstName, LastName, Role 
FROM tblEmployees 
WHERE FirstName = 'Carol' AND LastName = 'Martinez';

PRINT '✅ Process 3 Complete: New employee created';


-- PROCESS 4: Create Purchase Order with Details (INSERT)
PRINT '';
PRINT '--- PROCESS 4: Create Purchase Order with Details ---';

-- Insert purchase order header
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (1, 1, GETDATE(), DATEADD(DAY, 14, GETDATE()), 'Ordered');

-- Get the created PurchaseOrderID
DECLARE @NewOrderID INT;
SET @NewOrderID = SCOPE_IDENTITY();

-- Insert purchase order line items
INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(@NewOrderID, 1, 5, 850.00),  -- 5 Pro Laptops
(@NewOrderID, 2, 20, 45.75);  -- 20 Gamer Mice

-- Retrieve complete order details
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.Status,
    p.ProductName,
    pod.Quantity,
    pod.CostPerUnit,
    (pod.Quantity * pod.CostPerUnit) AS LineTotal
FROM tblPurchaseOrders po
INNER JOIN tblSuppliers s ON po.SupplierID = s.SupplierID
INNER JOIN tblEmployees e ON po.EmployeeID = e.EmployeeID
INNER JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
INNER JOIN tblProducts p ON pod.ProductID = p.ProductID
WHERE po.PurchaseOrderID = @NewOrderID
ORDER BY pod.PurchaseOrderDetailID;

PRINT '✅ Process 4 Complete: Purchase order created with order ID: ' + CAST(@NewOrderID AS VARCHAR);

-- PROCESS 5: View Purchase Order Status (SELECT)
PRINT '';
PRINT '--- PROCESS 5: View Purchase Order Status ---';

-- Query A: View specific purchase order details
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.Status,
    COUNT(pod.ProductID) AS ProductCount,
    SUM(pod.Quantity) AS TotalUnits,
    SUM(pod.Quantity * pod.CostPerUnit) AS TotalCost
FROM tblPurchaseOrders po
INNER JOIN tblSuppliers s ON po.SupplierID = s.SupplierID
INNER JOIN tblEmployees e ON po.EmployeeID = e.EmployeeID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.PurchaseOrderID = 1
GROUP BY po.PurchaseOrderID, s.SupplierName, e.FirstName, e.LastName, po.OrderDate, po.ExpectedDeliveryDate, po.Status;

-- Query B: View all orders for a specific supplier
SELECT 
    po.PurchaseOrderID,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.Status,
    SUM(pod.Quantity * pod.CostPerUnit) AS TotalCost
FROM tblPurchaseOrders po
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.SupplierID = 1
GROUP BY po.PurchaseOrderID, po.OrderDate, po.ExpectedDeliveryDate, po.Status
ORDER BY po.OrderDate DESC;

-- Query C: Filter orders by date range and status
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    po.OrderDate,
    po.Status,
    SUM(pod.Quantity * pod.CostPerUnit) AS TotalCost
FROM tblPurchaseOrders po
INNER JOIN tblSuppliers s ON po.SupplierID = s.SupplierID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.OrderDate BETWEEN '2025-10-01' AND '2025-12-31' 
  AND po.Status IN ('Ordered', 'Received')
GROUP BY po.PurchaseOrderID, s.SupplierName, po.OrderDate, po.Status
ORDER BY po.OrderDate DESC;

PRINT '✅ Process 5 Complete: Purchase order status views displayed';

-- PROCESS 6: Update Purchase Order Status (UPDATE)
PRINT '';
PRINT '--- PROCESS 6: Update Purchase Order Status ---';

-- Update purchase order status from Ordered to Received
UPDATE tblPurchaseOrders 
SET Status = 'Received' 
WHERE PurchaseOrderID = 3;

-- Verify the status update
SELECT PurchaseOrderID, Status, OrderDate 
FROM tblPurchaseOrders 
WHERE PurchaseOrderID = 3;

PRINT '✅ Process 6 Complete: Order status updated to Received';

-- PROCESS 7: Receive Shipment & Update Product Stock (UPDATE)
PRINT '';
PRINT '--- PROCESS 7: Receive Shipment & Update Product Stock ---';

-- Retrieve products in the purchase order
SELECT 
    pod.ProductID,
    p.ProductName,
    p.CurrentStock,
    pod.Quantity AS ReceivedQuantity
FROM tblPurchaseOrderDetails pod
INNER JOIN tblProducts p ON pod.ProductID = p.ProductID
WHERE pod.PurchaseOrderID = 3;

-- Update product stock based on received quantities
UPDATE tblProducts 
SET CurrentStock = CurrentStock + 20 
WHERE ProductID = 3;

-- Update purchase order status
UPDATE tblPurchaseOrders 
SET Status = 'Received' 
WHERE PurchaseOrderID = 3;

-- Verify the stock updates
SELECT ProductID, ProductName, CurrentStock, Brand, Model 
FROM tblProducts 
WHERE ProductID = 3;

PRINT '✅ Process 7 Complete: Stock updated after shipment received';

-- PROCESS 8: View Current Inventory & Stock Levels (SELECT)
PRINT '';
PRINT '--- PROCESS 8: View Current Inventory & Stock Levels ---';

-- Query A: View all products with stock levels
SELECT 
    ProductID,
    ProductName,
    Brand,
    Model,
    Description,
    CurrentStock,
    CASE 
        WHEN CurrentStock = 0 THEN 'Out of Stock'
        WHEN CurrentStock <= 10 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS StockStatus
FROM tblProducts
ORDER BY ProductName;

-- Query B: View products with low stock
SELECT 
    ProductID,
    ProductName,
    Brand,
    CurrentStock
FROM tblProducts
WHERE CurrentStock <= 15
ORDER BY CurrentStock ASC;

-- Query C: Inventory summary with aggregates
SELECT 
    COUNT(ProductID) AS TotalProducts,
    SUM(CurrentStock) AS TotalUnitsInStock,
    AVG(CurrentStock) AS AverageStockPerProduct,
    MIN(CurrentStock) AS LowestStock,
    MAX(CurrentStock) AS HighestStock
FROM tblProducts;

PRINT '✅ Process 8 Complete: Inventory and stock levels displayed';

-- PROCESS 9: View Supplier Information & Order History (SELECT)
PRINT '';
PRINT '--- PROCESS 9: View Supplier Information & Order History ---';

-- Query A: Supplier details with order history
SELECT 
    s.SupplierID,
    s.SupplierName,
    s.ContactPerson,
    s.Email,
    s.Phone,
    COUNT(po.PurchaseOrderID) AS TotalOrders,
    ISNULL(SUM(pod.Quantity * pod.CostPerUnit), 0) AS TotalSpent,
    MAX(po.OrderDate) AS LastOrderDate
FROM tblSuppliers s
LEFT JOIN tblPurchaseOrders po ON s.SupplierID = po.SupplierID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE s.SupplierID = 1
GROUP BY s.SupplierID, s.SupplierName, s.ContactPerson, s.Email, s.Phone;

-- Query B: All orders for a specific supplier with details
SELECT 
    po.PurchaseOrderID,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.Status,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    COUNT(pod.ProductID) AS ProductCount,
    SUM(pod.Quantity) AS TotalUnits,
    SUM(pod.Quantity * pod.CostPerUnit) AS OrderTotal
FROM tblPurchaseOrders po
INNER JOIN tblEmployees e ON po.EmployeeID = e.EmployeeID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.SupplierID = 1
GROUP BY po.PurchaseOrderID, po.OrderDate, po.ExpectedDeliveryDate, po.Status, e.FirstName, e.LastName
ORDER BY po.OrderDate DESC;

PRINT '✅ Process 9 Complete: Supplier information and order history displayed';

-- PROCESS 10: Generate Purchase Order Summary Report (SELECT)
PRINT '';
PRINT '--- PROCESS 10: Generate Purchase Order Summary Report ---';

-- Query A: Comprehensive purchase order report
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    po.OrderDate,
    po.Status,
    SUM(pod.Quantity) AS TotalQuantity,
    SUM(pod.Quantity * pod.CostPerUnit) AS OrderTotal
FROM tblPurchaseOrders po
INNER JOIN tblSuppliers s ON po.SupplierID = s.SupplierID
INNER JOIN tblEmployees e ON po.EmployeeID = e.EmployeeID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.OrderDate BETWEEN '2025-10-01' AND '2025-12-31'
GROUP BY po.PurchaseOrderID, s.SupplierName, e.FirstName, e.LastName, po.OrderDate, po.Status
ORDER BY po.OrderDate DESC;

-- Query B: Summary statistics report
SELECT 
    COUNT(DISTINCT po.PurchaseOrderID) AS TotalOrders,
    COUNT(DISTINCT po.SupplierID) AS ActiveSuppliers,
    SUM(pod.Quantity) AS TotalUnitsOrdered,
    SUM(pod.Quantity * pod.CostPerUnit) AS TotalAmountSpent,
    ROUND(AVG(pod.Quantity * pod.CostPerUnit), 2) AS AverageOrderValue,
    ROUND(SUM(pod.Quantity * pod.CostPerUnit) / COUNT(DISTINCT po.PurchaseOrderID), 2) AS AvgCostPerOrder
FROM tblPurchaseOrders po
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.OrderDate BETWEEN '2025-10-01' AND '2025-12-31' 
  AND po.Status != 'Cancelled';

-- Query C: Product breakdown - top products ordered
SELECT TOP 10
    p.ProductID,
    p.ProductName,
    p.Brand,
    p.Model,
    COUNT(DISTINCT pod.PurchaseOrderID) AS OrderFrequency,
    SUM(pod.Quantity) AS TotalQuantityOrdered,
    ROUND(AVG(pod.CostPerUnit), 2) AS AvgCostPerUnit,
    SUM(pod.Quantity * pod.CostPerUnit) AS TotalSpentOnProduct
FROM tblProducts p
LEFT JOIN tblPurchaseOrderDetails pod ON p.ProductID = pod.ProductID
LEFT JOIN tblPurchaseOrders po ON pod.PurchaseOrderID = po.PurchaseOrderID
WHERE po.OrderDate BETWEEN '2025-10-01' AND '2025-12-31' 
   OR po.PurchaseOrderID IS NULL
GROUP BY p.ProductID, p.ProductName, p.Brand, p.Model
ORDER BY TotalSpentOnProduct DESC;

-- Query D: Supplier spending report
SELECT 
    s.SupplierID,
    s.SupplierName,
    COUNT(DISTINCT po.PurchaseOrderID) AS OrderCount,
    ISNULL(SUM(pod.Quantity * pod.CostPerUnit), 0) AS TotalSpent,
    ROUND(ISNULL(SUM(pod.Quantity * pod.CostPerUnit) / COUNT(DISTINCT po.PurchaseOrderID), 0), 2) AS AvgOrderValue
FROM tblSuppliers s
LEFT JOIN tblPurchaseOrders po ON s.SupplierID = po.SupplierID
LEFT JOIN tblPurchaseOrderDetails pod ON po.PurchaseOrderID = pod.PurchaseOrderID
WHERE po.OrderDate BETWEEN '2025-10-01' AND '2025-12-31' 
   OR po.PurchaseOrderID IS NULL
GROUP BY s.SupplierID, s.SupplierName
ORDER BY TotalSpent DESC;

PRINT '✅ Process 10 Complete: Purchase order summary reports generated';

