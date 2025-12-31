# SQL Scripts

This directory contains all **T-SQL scripts** used to implement the relational database schema on **Azure SQL Database**.  
The scripts are organized to support **reproducible deployment**, **clear version control**, and **easy review**.

---

## Directory Contents

sql/
├── 01_schema.sql
├── 02_constraints.sql
├── 03_views.sql
├── 04_stored_procedures.sql
├── 05_test_data.sql
└── README.md


---

## Script Descriptions

### `01_schema.sql`
- Creates all database tables
- Defines columns and data types
- Establishes base table structures
- No foreign keys or constraints applied at this stage

### `02_constraints.sql`
- Defines primary keys
- Defines foreign key relationships
- Enforces referential integrity
- Adds unique and check constraints where applicable

### `03_views.sql`
- Creates database views
- Supports read-only queries and reporting
- Simplifies complex joins for reuse

### `04_stored_procedures.sql`
- Implements database processes using stored procedures
- Includes CRUD operations (Create, Read, Update, Delete)
- Contains parameterized procedures for security and reuse

### `05_test_data.sql`
- Inserts sample data into tables
- Provides a minimum of 10 records per core table
- Enables testing of relationships, constraints, and procedures

---

## Execution Order

Scripts **must be executed in the following order**:

1. `01_schema.sql`
2. `02_constraints.sql`
3. `03_views.sql`
4. `04_stored_procedures.sql`
5. `05_test_data.sql`

Executing scripts out of order may result in dependency errors.

---

## Deployment Instructions

1. Connect to the Azure SQL Database using:
   - SQL Server Management Studio (SSMS), or
   - Azure Data Studio
2. Open each script in order
3. Execute and verify successful completion
4. Run sample queries or stored procedures to validate the deployment

---

## Notes

- All scripts are rewritten in **T-SQL** (from **SQL**) and are compatible with **Azure SQL Database**
- No credentials or connection strings are stored in this repository
- Scripts are idempotent where practical and intended for clean deployments

---

## Purpose

This directory represents the **core deliverable** of the database system, implementing:
- Normalized relational schema (3NF)
- Referential integrity
- Reusable database logic
- Test data for demonstration and validation

