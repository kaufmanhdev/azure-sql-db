# Azure Architecture Documentation

## Project Overview

This project implements a **relational database system** deployed on **Microsoft Azure SQL Database**. The architecture ensures a scalable, secure, and collaborative environment suitable for academic assignments and small-scale production prototypes.  

The Azure infrastructure primarily hosts the database and provides connectivity to perform database operations using SQL tools.

---

## Architecture Diagram

     +---------------------+
     |   Client Tools      |
     | (SSMS / Azure DS)  |
     +---------+-----------+
               |
               |
               v
    +---------------------+
    |   Azure SQL Server  |
    | (Logical Server)    |
    +---------+-----------+
               |
               |
               v
    +---------------------+
    | Azure SQL Database  |
    | (Assignment3DB)    |
    +---------------------+



**Description:**  
- **Client Tools**: SQL Server Management Studio (SSMS) or Azure Data Studio connect to Azure SQL Database for executing queries, scripts, and testing procedures.  
- **Azure SQL Server**: Logical server acting as a container for one or more databases. Provides authentication, firewall configuration, and security policies.  
- **Azure SQL Database**: The actual relational database where all tables, relationships, stored procedures, and test data reside.

---

## Components

| Component | Purpose |
|-----------|---------|
| Resource Group (`rg-db-assignment3`) | Logical container for all Azure resources associated with this project. |
| Azure SQL Server (`sql-assignment3`) | Logical server hosting the database. Manages authentication and firewall rules. |
| Azure SQL Database (`Assignment3DB`) | Primary database storing tables, relationships, stored procedures, views, and test data. |
| Firewall Rules | Controls access to the server by allowing specific IP addresses (team members) and Azure services. |
| Client Tools | SSMS or Azure Data Studio used to connect, query, and manage the database. |

---

## Security Considerations

- **Authentication:** SQL Server authentication with an admin username and password. Optional Azure Active Directory (AAD) authentication can be enabled for additional security.  
- **Firewall Rules:** Only IP addresses of team members and Azure services are allowed to connect. This prevents unauthorized access.  
- **Data Protection:** Azure SQL provides encryption at rest (Transparent Data Encryption) by default.  
- **Access Control:** All database operations are performed by team members using their SQL logins; no public endpoints are exposed.

---

## Design Decisions

1. **Choice of Azure SQL Database**:  
   - Easy setup and management.  
   - Fully managed service with high availability.  
   - Simplifies collaboration since all team members can connect remotely.  

2. **Logical Server Separation**:  
   - Allows multiple databases on a single server if future expansions are needed.  
   - Centralizes firewall and authentication configuration.  

3. **Client Tools Usage**:  
   - SQL Server Management Studio (SSMS) or Azure Data Studio ensures consistent testing and execution of SQL scripts.  

---

**Notes for Team Demo:**
- During the seminar, the Azure portal can be shown to illustrate the server and database.  
- Connection from SSMS or Azure Data Studio should be demonstrated to validate firewall and authentication configuration.  
- This document serves as the blueprint for the cloud infrastructure portion of the assignment.

