# SQL Data Management Project: Inventory & Purchase Order System

**Student:** Arshia Kahani, Herman Kaufman  
**Course:** Data Management (Kulhánek Rastislav)
**Assignment:** Final Database System Project

---

## 📖 Project Overview
This repository contains the source code and documentation for a complete SQL Server database system designed to manage **Inventory, Supply Chain, and Purchase Orders**.

The system enables the tracking of products, management of supplier relationships, and processing of purchase orders by employees. It is fully normalized to **3rd Normal Form (3NF)** and includes a suite of 10 business processes to demonstrate data integrity and operational logic.

---

## ✅ Requirement Fulfillment Checklist
*(Guide for the assessment)*

| Requirement | Status | Implementation Details |
| :--- | :---: | :--- |
| **Entities & Tables** | ✅ | System contains **5** base tables representing **4 key entities**: Suppliers, Employees, Products, and Orders. |
| **Primary Keys** | ✅ | All tables (`tblSuppliers`, `tblProducts`, etc.) use `IDENTITY` columns as Primary Keys. |
| **Foreign Keys** | ✅ | Referential integrity enforced on all relationships (e.g., `tblPurchaseOrders` links to `tblSuppliers` & `tblEmployees`). |
| **3NF Normalization** | ✅ | All attributes depend on the key, the whole key, and nothing but the key. |
| **10+ Processes** | ✅ | Includes **10** distinct business processes including CRUD, complex reporting, and stock management logic. |
| **Test Data** | ✅ | Scripts populate the database with **12+** suppliers, **15+** products, and **12+** orders. |

---

## 📂 Repository Structure
* **`/sql`**: Contains the source `.sql` files.
    * `01-tables.sql`: Table definitions.
    * `02-populate-data.sql`: Test data insertion.
    * `03-processes.sql`: The 10 implemented business processes.
* **`/docs`**: Detailed documentation.
    * [Database Schema & Normalization](./docs/SCHEMA.md)
    * [Implemented Processes](./docs/PROCESSES.md)
    * [Setup Guide](./docs/SETUP.md)

---

## 🚀 How to Run the Project
1.  **Create the Database**: Run `01-tables.sql` to build the schema.
2.  **Load Data**: Run `02-populate-data.sql` to insert the test records.
3.  **Test Logic**: Run `03-processes.sql` to execute the 10 business scenarios.

---
