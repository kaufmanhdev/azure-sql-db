# 🗄️ Database Schema & Normalization

## 📊 Entity Relationship Diagram (ERD)
The system is built on **5 core tables** connected via Foreign Keys.

## 📑 Table Definitions

### 1. `tblSuppliers`
*Description: Stores contact and identity information for product suppliers.*
* **PK**: `SupplierID` (INT, Identity)
* **Columns**: `SupplierName`, `ContactPerson`, `Email`, `Phone`

### 2. `tblEmployees`
*Description: Internal staff members authorized to place purchase orders.*
* **PK**: `EmployeeID` (INT, Identity)
* **Columns**: `FirstName`, `LastName`, `Role`

### 3. `tblProducts`
*Description: The master inventory list of all items available for purchase.*
* **PK**: `ProductID` (INT, Identity)
* **Columns**: `ProductName`, `Description`, `Brand`, `Model`, `CurrentStock`
* **Constraint**: `CurrentStock >= 0` (Prevents negative inventory)

### 4. `tblPurchaseOrders`
*Description: The header record for a transaction between the company and a supplier.*
* **PK**: `PurchaseOrderID` (INT, Identity)
* **FK**: `SupplierID` (Links to `tblSuppliers`)
* **FK**: `EmployeeID` (Links to `tblEmployees`)
* **Columns**: `OrderDate`, `ExpectedDeliveryDate`, `Status` (Default: 'Ordered')

### 5. `tblPurchaseOrderDetails`
*Description: Line items for each order, linking specific products and quantities.*
* **PK**: `PurchaseOrderDetailID` (INT, Identity)
* **FK**: `PurchaseOrderID` (Links to `tblPurchaseOrders`)
* **FK**: `ProductID` (Links to `tblProducts`)
* **Columns**: `Quantity`, `CostPerUnit`

---

## 📐 Normalization Justification (3NF)
The database adheres to the 3rd Normal Form:
1.  **1NF**: All columns (e.g., `Phone`, `Email`) are atomic; no repeating groups.
2.  **2NF**: All non-key attributes (like `SupplierName`) depend on the full Primary Key. Line items are separated into `tblPurchaseOrderDetails` to avoid partial dependencies.
3.  **3NF**: No transitive dependencies. For example, `SupplierName` is stored only in `tblSuppliers`, not repeated in `tblPurchaseOrders`.
