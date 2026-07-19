# Week 5 - Apache Spark DataFrame Fundamentals

This repository contains the implementation of **Week 5 – Spark DataFrame Fundamentals**, focusing on data cleaning, transformation, filtering, aggregation, and building a complete data processing pipeline using **PySpark**.

The project demonstrates the basic concepts of Apache Spark DataFrames through a structured Jupyter Notebook and a realistic dataset.

---

# Project Structure

```
Week5/
│
├── data/
│   └── dataset.csv              # Dataset containing 25,500 records
│
├── notebook/
│   └── spark_basics.ipynb       # Complete PySpark implementation
│
├── output/                      # Store screenshots/results if required
│
├── QnA.md                       # Theoretical answers for Week 5
│
└── README.md                    # Project documentation
```

---

# Objective

The objective of this assignment is to understand the fundamentals of **Apache Spark** and perform various data processing operations using **Spark DataFrames**.

The notebook demonstrates:

- Understanding Spark fundamentals
- Loading CSV files into Spark DataFrames
- Data cleaning
- Data transformation
- Filtering records
- Aggregation operations
- GroupBy operations
- Understanding shuffle and wide transformations
- Building a complete ETL pipeline

---

# Technologies Used

- Python 3.x
- Apache Spark (PySpark 4.2.0)
- Jupyter Notebook
- Java 17
- VS Code

---

# Dataset Information

The dataset used for this project was generated specifically for Spark practice.

### Dataset Statistics

| Property          |      Value |
| ----------------- | ---------: |
| Total Rows        | **25,500** |
| Total Columns     |     **20** |
| Duplicate Records |        Yes |
| Null Values       |        Yes |
| Empty Strings     |        Yes |
| Date Columns      |        Yes |
| Timestamp Columns |        Yes |

### Dataset Columns

- user_id
- transaction_date
- raw_timestamp
- customer_name
- email
- username
- city
- state
- country
- region
- product_category
- product_name
- price
- quantity
- sale_amount
- discount
- age
- subscription
- status
- store_id

---

# Steps Performed

## 1. Import Libraries

Imported the required PySpark libraries:

- SparkSession
- Spark SQL Functions
- Spark SQL Data Types

---

## 2. Create Spark Session

A Spark Session was created to initialize the Spark application.

```python
spark = SparkSession.builder \
    .appName("Week5 Spark Basics") \
    .getOrCreate()
```

---

## 3. Load Dataset

The CSV dataset was loaded into a Spark DataFrame using:

```python
df = spark.read.csv(
    "../data/dataset.csv",
    header=True,
    inferSchema=True
)
```

The following operations were performed:

- Display first 10 rows
- Print schema
- Display column names
- Count rows
- Count columns

---

## 4. Understand the Dataset

Basic exploratory analysis included:

- Dataset summary
- Schema inspection
- Data types
- Record count
- Column count

---

## 5. Data Cleaning

The following cleaning operations were performed:

- Removed duplicate rows
- Removed duplicates based on:
  - user_id
  - transaction_date
- Dropped null values
- Filled null values
- Replaced missing status with **Unknown**
- Replaced missing price with **0**
- Removed records containing:
  - Null email
  - Empty username

---

## 6. Filtering

Several filtering conditions were applied.

Examples include:

- Premium subscribers
- West region customers
- Users between age 18 and 30
- Electronics category

---

## 7. Data Transformation

Transformation operations performed:

- Renamed **raw_timestamp** to **event_time**
- Converted event_time to **TimestampType**

---

## 8. Aggregation

Several aggregation functions were demonstrated.

These include:

- Count
- Average
- Minimum
- Maximum
- Multiple aggregations using `.agg()`

---

## 9. GroupBy Operations

Grouping operations were performed on:

- City
- Store ID
- Product Category

Aggregation functions used:

- count()
- sum()
- avg()

---

## 10. Wide Transformation and Shuffle

Basic concepts covered:

### Wide Transformation

Operations where data moves across different partitions.

Examples:

- groupBy()
- join()
- distinct()

### Shuffle

Redistribution of data across partitions during grouping or joining operations.

---

## 11. Data Processing Pipeline

A complete Spark ETL pipeline was created by combining multiple transformations.

Pipeline Steps:

1. Load dataset
2. Remove duplicates
3. Fill missing values
4. Filter West region
5. Rename timestamp column
6. Convert timestamp datatype
7. Group by store_id
8. Calculate total revenue

---

# Spark Concepts Covered

- Spark Session
- Spark DataFrames
- CSV Reading
- Data Cleaning
- Duplicate Removal
- Null Handling
- Filtering
- Data Transformation
- Column Renaming
- Data Type Casting
- Aggregation
- GroupBy
- Shuffle
- Wide Transformations
- ETL Pipeline

---

# Learning Outcomes

After completing this assignment, the following concepts were understood:

- Fundamentals of Apache Spark
- Advantages of Spark over Hadoop MapReduce
- In-memory processing
- DataFrame operations
- Data cleaning techniques
- Aggregation and grouping
- Schema modification
- Spark transformations
- Building scalable data processing workflows

---

# Conclusion

This project demonstrates the fundamental capabilities of Apache Spark using the DataFrame API. A complete workflow was implemented starting from loading a CSV dataset to performing data cleaning, filtering, transformations, aggregation, and finally building an end-to-end ETL pipeline.

The notebook highlights how Spark simplifies large-scale data processing through its in-memory computation model, distributed architecture, and optimized DataFrame operations. These concepts form the foundation of modern data engineering and big data analytics workflows.

---

# Author

**Aditi Gaikwad**

**MIT WPU | MCA Student | Data Engineering Intern**

Week 5 – Apache Spark DataFrame Fundamentals
