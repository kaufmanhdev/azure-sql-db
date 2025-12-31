# 🛠️ Setup & Deployment Guide

## Prerequisites
* **Microsoft Azure SQL Database** (or local SQL Server)
* **Azure Data Studio** or **SSMS**

## Deployment Steps
To deploy the database, execute the scripts in the `/sql` folder in the following strict order (to avoid Foreign Key errors):

1.  **`01-tables.sql`**
    * *Action:* Creates the 5 empty tables.
2.  **`02-populate-data.sql`**
    * *Action:* Inserts the sample data (12 Suppliers, 15 Products, 12 Orders).
3.  **`03-processes.sql`**
    * *Action:* This script is not for deployment but for **demonstration**. Run individual blocks of this script to show the teacher how the system creates orders, updates stock, and generates reports.
