# Azure SQL Database Setup Guide

This document provides step-by-step instructions to recreate the Azure environment used in this project.

## Prerequisites

- Active Microsoft Azure account
- SQL Server Management Studio (SSMS) or Azure Data Studio
- Power Apps access (Microsoft account)

## Step 1: Create Resource Group

1. Log in to Azure Portal
2. Navigate to Resource Groups → Create
3. Name the resource group (e.g., `rg-azure-sql-db`)
4. Select a region
5. Create

## Step 2: Create Azure SQL Server

1. Navigate to SQL Servers → Create
2. Choose the previously created resource group
3. Set server name, admin username, and password
4. Use the same region as the resource group
5. Create server

## Step 3: Create Azure SQL Database

1. Navigate to SQL Databases → Create
2. Select the SQL server created earlier
3. Database name: `Assignment3DB`
4. Workload: Development
5. Pricing tier: Basic or lowest General Purpose
6. Create database

## Step 4: Configure Firewall

1. Open the SQL Server resource
2. Go to Networking
3. Enable access for Azure services
4. Add client IP addresses
5. Save changes

## Step 5: Connect and Deploy SQL Scripts

1. Connect using SSMS or Azure Data Studio
2. Execute SQL scripts located within the sql/ by their number.

## Step 6: Verify Deployment

- Run sample SELECT queries
- Execute stored procedures
- Confirm test data exists

