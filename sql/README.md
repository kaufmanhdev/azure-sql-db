# SQL Scripts

This directory contains all **T-SQL scripts** used to implement the Inventory & Purchase Order database system on **Azure SQL Database**.

The scripts are organized to support **reproducible deployment** and **logical grouping** of the assignment requirements.

---

## Directory Contents

sql/
├── 01-tables.sql
├── 02-populate-data.sql
├── 03-processes.sql
└── README.md

---

## Script Descriptions

### `01-tables.sql`
- **Creates all database tables** (Suppliers, Employees, Products, Orders, OrderDetails).
- **Defines Constraints**: Sets up Primary Keys (Identity) and Foreign Keys immediately.
- **Ensures Data Integrity**: Establishes the 3NF schema structure.

### `02-populate-data.sql`
- **Inserts Test Data**: Populates the database with valid records.
- **Volume**: Includes at least 10 records per core table (Suppliers, Products, Orders).
- **Dependency Handling**: Inserts data in the correct order (Suppliers/Employees first -> then Orders) to respect Foreign Keys.

### `03-processes.sql`
- **Implements Database Logic**: Contains the 10+ required processes.
- **Stored Procedures**: Complex logic for reports and updates.
- **Views**: Pre-built queries for common data retrieval.
- **CRUD Operations**: Demonstration of Create, Read, Update, and Delete actions.

---

## Execution Order

Scripts **must be executed in the following order** to avoid Foreign Key errors:

1. `01-tables.sql` (Builds the empty structure)
2. `02-populate-data.sql` (Fills it with data)
3. `03-processes.sql` (Loads the stored procedures and views)

---

## Deployment Instructions

1. Connect to the Azure SQL Database (or local SQL Server) using **SSMS** or **Azure Data Studio**.
2. Open `01-tables.sql` and execute. Verify "Commands completed successfully."
3. Open `02-populate-data.sql` and execute. Verify rows affected.
4. Open `03-processes.sql` and execute to create the procedures and views.
5. You can now highlight and run individual test queries inside `03-processes.sql` to demonstrate functionality.

---

## Notes

- All scripts are written in **T-SQL** and are compatible with **Azure SQL Database**.
- The `03-processes.sql` file contains both the *definition* of objects (CREATE PROCEDURE...) and *execution examples* (EXEC...) for demonstration purposes.

---

## Purpose

This directory represents the **core deliverable** of the database system, implementing:
- Normalized relational schema (3NF) with 5 linked tables.
- Referential integrity via Foreign Keys.
- A suite of 10 business processes covering CRUD and Reporting.
