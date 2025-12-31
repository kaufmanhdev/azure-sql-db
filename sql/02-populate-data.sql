-- populating_tables.sql - CORRECTED FOR T-SQL

-- Insert Sample Suppliers (10+ records required)

INSERT INTO tblSuppliers (SupplierName, ContactPerson, Email, Phone) VALUES
('Global Electronics Inc.', 'Sarah Chen', 'sarah@globalelec.com', '555-0101'),
('Component Solutions', 'David Rodriguez', 'david@components.com', '555-0102'),
('Gadget Innovators', 'Emily White', 'emily@gadgetinnov.com', '555-0103'),
('Tech Wholesale Direct', 'Michael Brown', 'mbrown@techwholesale.com', '555-0104'),
('Digital Supplies Co.', 'Jennifer Lee', 'jlee@digitalsupplies.com', '555-0105'),
('Smart Devices Ltd.', 'Robert Taylor', 'rtaylor@smartdevices.com', '555-0106'),
('Prime Electronics', 'Lisa Anderson', 'landerson@primeelectronics.com', '555-0107'),
('Future Tech Partners', 'James Wilson', 'jwilson@futuretech.com', '555-0108'),
('Innovative Gadgets Inc.', 'Maria Garcia', 'mgarcia@innovgadgets.com', '555-0109'),
('Tech Solutions Group', 'Thomas Martinez', 'tmartinez@techsolutions.com', '555-0110'),
('Advanced Components', 'Patricia Davis', 'pdavis@advancedcomp.com', '555-0111'),
('Digital Era Suppliers', 'Christopher Johnson', 'cjohnson@digitalera.com', '555-0112');

PRINT '✅ Inserted 12 suppliers';


-- Insert Sample Products (15 products)

INSERT INTO tblProducts (ProductName, Description, Brand, Model, CurrentStock) VALUES
('Pro Laptop 15"', '16GB RAM, 512GB SSD, M3 Pro Chip', 'TechBrand', 'TB-PL15', 25),
('Gamer Mouse Pro', 'Wireless RGB gaming mouse with 16000 DPI', 'GameGear', 'GG-MP', 60),
('Smart Home Hub', 'Central hub for all smart devices', 'HomeLink', 'HL-Hub2', 40),
('10-inch Tablet', '32GB Storage, HD Display', 'TechBrand', 'TB-T10', 30),
('Wireless Keyboard', 'Mechanical RGB keyboard with blue switches', 'KeyMaster', 'KM-WK1', 45),
('4K Webcam', 'Ultra HD webcam with noise cancellation', 'CamTech', 'CT-4K', 35),
('USB-C Hub', '7-in-1 USB-C hub with HDMI and SD card reader', 'ConnectPro', 'CP-HUB7', 80),
('Bluetooth Headphones', 'Noise cancelling over-ear headphones', 'AudioMax', 'AM-BH500', 55),
('External SSD 1TB', 'Portable SSD with USB 3.2 Gen 2', 'StoragePlus', 'SP-SSD1', 42),
('Gaming Monitor 27"', '144Hz refresh rate, 1ms response time', 'ViewPro', 'VP-GM27', 18),
('Wireless Charger', 'Fast charging pad for smartphones', 'ChargeFast', 'CF-WC15', 70),
('Smart Watch', 'Fitness tracker with heart rate monitor', 'WearTech', 'WT-SW3', 38),
('Portable Speaker', 'Waterproof Bluetooth speaker', 'SoundWave', 'SW-PS20', 65),
('Laptop Stand', 'Adjustable aluminum laptop stand', 'ErgoPro', 'EP-LS1', 50),
('HDMI Cable 2m', '4K HDMI 2.1 cable', 'CableLink', 'CL-HDMI2', 120);

PRINT '✅ Inserted 15 products';


-- Insert Sample Employees (10+ records required)

INSERT INTO tblEmployees (FirstName, LastName, Role) VALUES
('Alice', 'Johnson', 'Store Manager'),
('Bob', 'Williams', 'Warehouse Staff'),
('Carol', 'Smith', 'Inventory Specialist'),
('Daniel', 'Brown', 'Purchasing Agent'),
('Emma', 'Davis', 'Warehouse Staff'),
('Frank', 'Miller', 'Senior Buyer'),
('Grace', 'Wilson', 'Inventory Analyst'),
('Henry', 'Moore', 'Warehouse Supervisor'),
('Isabel', 'Taylor', 'Purchasing Coordinator'),
('Jack', 'Anderson', 'Stock Controller'),
('Karen', 'Thomas', 'Logistics Manager'),
('Leo', 'Jackson', 'Warehouse Staff');

PRINT '✅ Inserted 12 employees';

-- Insert Purchase Orders with Line Items

-- Order 1: Global Electronics + Products

INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (1, 1, '2025-10-20', '2025-11-05', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(1, 1, 10, 850.00),
(1, 4, 15, 220.50);

-- Order 2: Component Solutions + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (2, 2, '2025-10-22', '2025-11-10', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(2, 2, 50, 45.75);


-- Order 3: Gadget Innovators + Products (RECEIVED)
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (3, 1, '2025-10-25', '2025-11-15', 'Received');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(3, 3, 20, 75.00);

-- Order 4: Tech Wholesale Direct + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (4, 4, '2025-11-01', '2025-11-20', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(4, 5, 30, 95.00),
(4, 6, 25, 125.50);

-- Order 5: Digital Supplies Co + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (5, 3, '2025-11-03', '2025-11-18', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(5, 7, 60, 32.00),
(5, 11, 40, 28.00);


-- Order 6: Smart Devices Ltd + Products (RECEIVED)
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (6, 6, '2025-11-05', '2025-11-12', 'Received');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(6, 8, 35, 180.00);


-- Order 7: Prime Electronics + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (7, 7, '2025-11-08', '2025-11-25', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(7, 9, 28, 215.00),
(7, 14, 35, 42.00);


-- Order 8: Future Tech Partners + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (8, 8, '2025-11-10', '2025-11-28', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(8, 10, 12, 485.00);


-- Order 9: Innovative Gadgets Inc + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (9, 9, '2025-11-12', '2025-11-30', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(9, 12, 25, 295.00),
(9, 13, 40, 68.50);


-- Order 10: Tech Solutions Group + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (10, 10, '2025-11-15', '2025-12-02', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(10, 15, 100, 18.00);


-- Order 11: Advanced Components + Products (RECEIVED)
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (11, 11, '2025-11-18', '2025-11-22', 'Received');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(11, 1, 5, 840.00),
(11, 5, 15, 92.00);



-- Order 12: Digital Era Suppliers + Products
INSERT INTO tblPurchaseOrders (SupplierID, EmployeeID, OrderDate, ExpectedDeliveryDate, Status) 
VALUES (12, 12, '2025-11-20', '2025-12-05', 'Ordered');

INSERT INTO tblPurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, CostPerUnit) VALUES
(12, 2, 45, 46.00),
(12, 7, 30, 31.50),
(12, 11, 25, 27.50);

