# ⚙️ Implemented Processes

The project implements **10 defined business processes** that cover CRUD operations, aggregation, and complex joining.

## 🟢 Data Entry (Create)
| Process | Description | SQL Logic |
| :--- | :--- | :--- |
| **1. Add New Supplier** | Registers a new vendor in the system. | `INSERT INTO tblSuppliers...` |
| **2. Add New Product** | Adds a new item to the master inventory. | `INSERT INTO tblProducts...` |
| **3. Create Employee** | Registers a new staff member. | `INSERT INTO tblEmployees...` |
| **4. Create Purchase Order** | Complex transaction: Creates an Order Header and immediately inserts multiple Line Items using `SCOPE_IDENTITY()`. | `INSERT INTO tblPurchaseOrders...` |

## 🔵 Data Retrieval & Reporting (Read)
| Process | Description | SQL Logic |
| :--- | :--- | :--- |
| **5. View Order Status** | Joins 4 tables (`Orders`, `Suppliers`, `Employees`, `Details`) to show full order context and calculated totals. | `SELECT ... JOIN ... GROUP BY` |
| **8. Inventory Levels** | Uses `CASE` statements to categorize stock as "In Stock", "Low Stock", or "Out of Stock". | `SELECT ... CASE WHEN ...` |
| **9. Supplier History** | Aggregates total spend and order count per supplier. | `SUM()`, `COUNT()` |
| **10. Summary Reports** | Generates high-level statistics: Total Active Suppliers, Total Spend, and Average Order Value. | `AVG()`, `ROUND()` |

## 🟠 Data Modification (Update)
| Process | Description | SQL Logic |
| :--- | :--- | :--- |
| **6. Update Order Status** | Changes an order from 'Ordered' to 'Received'. | `UPDATE tblPurchaseOrders SET Status...` |
| **7. Receive Shipment** | **Transaction Logic**: Updates the status of the order AND automatically increments the `CurrentStock` of the relevant products. | `UPDATE tblProducts SET CurrentStock = CurrentStock + ...` |
