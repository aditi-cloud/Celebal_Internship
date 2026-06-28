# SQL Sales Data Analysis using SSMS

## Objective

The objective of this project is to analyze the Sample Superstore sales dataset using SQL Server Management Studio (SSMS). The assignment covers data exploration, filtering, aggregation, joins, business queries, and data validation using SQL.

---

## Tools Used

- SQL Server Express
- SQL Server Management Studio (SSMS)
- GitHub
- Visual Studio Code

---

## Dataset

- Dataset Name: Sample Superstore
- Format: CSV
- Records: 9,994
- Columns: 21

The dataset was imported into SQL Server using the **Import Flat File Wizard** available in SSMS.

---

# Project Structure

```
sql-assignment/
│
├── Dataset/
│   └── Sample - Superstore.csv
│
├── Section_A/
│   └── basic_queries.sql
│
├── Section_B/
│   └── filtering_queries.sql
│
├── Section_C/
│   └── aggregation_queries.sql
│
├── Section_D/
│   └── joins_queries.sql
│
├── Section_E/
│   └── validation_queries.sql
│
├── README.md
└── execution_guide.md
```

---

# Steps to Run the Assignment

## Step 1. Install SQL Server

Install:

- SQL Server Express
- SQL Server Management Studio (SSMS)

---

## Step 2. Connect to SQL Server

Open SSMS and connect using

```
Server Name:
localhost\SQLEXPRESS

Authentication:
Windows Authentication
```

Click **Connect**.

---

## Step 3. Create Database

Open a New Query window and execute

```sql
CREATE DATABASE SuperstoreDB;
GO

USE SuperstoreDB;
GO
```

---

## Step 4. Import the Dataset

1. Expand **Databases**
2. Right-click **SuperstoreDB**
3. Select **Tasks**
4. Click **Import Flat File**
5. Browse to **Sample - Superstore.csv**
6. Verify the detected data types
7. Click **Finish**

A table named **Superstore** will be created automatically.

---

## Step 5. Execute SQL Files

Run the SQL files in the following order:

1. Section_A/basic_queries.sql
2. Section_B/filtering_queries.sql
3. Section_C/aggregation_queries.sql
4. Section_D/joins_queries.sql
5. Section_E/validation_queries.sql

To execute a file:

- Open the SQL file
- Press **F5** or click **Execute**
- View the output in the Results window

---

## Step 6. Save Results

To save query outputs:

- Right-click inside the Results Grid
- Select **Save Results As**
- Save the file as CSV

Alternatively, screenshots of the result grids can be included in the project report.

---

## Step 7. Push to GitHub

Open the project folder in VS Code.

Run:

```bash
git add .
git commit -m "Completed SQL Sales Analysis Assignment"
git push origin main
```

---

# SQL Concepts Used

- SELECT
- DISTINCT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Subqueries

---

# Result Analysis

## Section A – Basic Queries

- The dataset contains **9,994 records**.
- The table consists of **21 columns** containing order, customer, product, and sales information.
- There are **4 sales regions**:
  - Central
  - East
  - South
  - West
- Products are divided into **3 categories**:
  - Furniture
  - Office Supplies
  - Technology
- The dataset contains **793 unique customers** and **1,862 unique products**.
- Sales data spans from **3 January 2014** to **30 December 2017**.

---

## Section B – Filtering

Filtering queries were used to retrieve specific subsets of the dataset.

Examples include:

- Orders from the West region
- Orders from the East region
- Technology products
- Furniture products
- Orders with sales greater than 1000
- High profit orders
- Discounted orders
- Orders placed during 2017

These queries demonstrate how SQL can efficiently retrieve records based on different business conditions.

---

## Section C – Aggregation

Aggregate functions were used to summarize the sales data.

### Overall Statistics

- Total Sales: **2,297,200.86**
- Total Profit: **286,817.02**
- Average Sales per Order: **229.86**

### Sales by Region

| Region | Observation |
|---------|-------------|
| West | Highest sales |
| East | Second highest |
| Central | Moderate sales |
| South | Lowest sales |

### Profit by Region

- West generated the highest overall profit.
- Central generated the lowest profit.

### Sales by Category

Technology contributed the highest sales followed by Furniture and Office Supplies.

### Profit by Category

Technology generated the highest profit among all product categories.

### Quantity Sold

Office Supplies recorded the highest number of units sold.

### Sales by Segment

Consumer customers generated the highest revenue followed by Corporate and Home Office customers.

---

## Section D – Join Operations

Normalized tables were created from the original dataset to demonstrate SQL joins.

The following join operations were performed:

- INNER JOIN between Customers and Orders
- INNER JOIN between Products and Sales
- LEFT JOIN to include all customer records
- Multi-table joins for customer-product analysis

These joins demonstrate how data from multiple tables can be combined to generate meaningful business insights.

---

## Section E – Data Validation

Several validation queries were executed to verify data quality.

### Validation Results

- Total records: **9,994**
- No missing values were found in key columns such as Order_ID, Customer_ID and Product_ID.
- Only one missing value was identified in the Sales column.
- Duplicate Order IDs exist because a single order can contain multiple products.
- Customer IDs also appear multiple times because customers place multiple orders.

Additional validation included:

- Negative profit orders
- Unique customer count
- Unique product count
- Sales statistics
- Profit statistics
- Dataset date range

These checks confirmed that the dataset was imported successfully and is suitable for analysis.

---

# Conclusion

This project demonstrates the use of SQL for exploratory data analysis on a retail sales dataset. The queries cover data exploration, filtering, aggregation, joins, and validation, providing valuable business insights into sales performance, customer behavior, product performance, and regional trends.