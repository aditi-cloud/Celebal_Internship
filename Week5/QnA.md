# Week 5 - Apache Spark DataFrame Fundamentals

# Q1. What are the key limitations of traditional MapReduce that make Spark a preferred choice for modern big data processing?

## Definition

**MapReduce** is a distributed programming model introduced by Hadoop for processing massive datasets across multiple computers. It divides the computation into two phases:

- **Map Phase:** Processes input data and converts it into key-value pairs.
- **Reduce Phase:** Aggregates and combines the intermediate results to produce the final output.

Although MapReduce was revolutionary in handling big data, it has several performance limitations. Apache Spark was developed to overcome these limitations and provide faster and more efficient data processing.

---

## Explanation

The primary limitation of Hadoop MapReduce is that every stage writes intermediate results to disk before the next stage begins. Since disk input/output (I/O) operations are significantly slower than memory operations, the execution time increases considerably.

For example, if a job consists of five processing stages, MapReduce stores the output of each stage on disk before continuing to the next stage. This repeated reading and writing makes processing slow, especially for iterative algorithms such as Machine Learning.

Apache Spark eliminates this overhead by storing intermediate data in memory (RAM). This reduces disk access and significantly improves processing speed.

---

## Key Limitations of MapReduce

### 1. Disk-Based Processing

MapReduce stores intermediate data on the Hadoop Distributed File System (HDFS) after every Map and Reduce operation.

**Problem:**

- Frequent disk access slows execution.
- Increased I/O operations consume more time.

**Example Flow**

```
Input Data
      ↓
Map
      ↓
Write to Disk
      ↓
Reduce
      ↓
Write to Disk
      ↓
Next Job
```

---

### 2. Slow Performance

Disk operations are much slower than memory operations.

As a result, MapReduce performs poorly for:

- Data Analytics
- Machine Learning
- Graph Processing
- Interactive Queries

Spark performs these operations much faster using in-memory computing.

---

### 3. Poor Support for Iterative Algorithms

Machine Learning algorithms repeatedly process the same dataset.

Examples include:

- K-Means Clustering
- Logistic Regression
- Decision Trees
- Gradient Descent

MapReduce reloads the data from disk in every iteration.

Spark loads the data once into memory and reuses it for all iterations.

---

### 4. Complex Programming Model

A simple analytical task may require multiple MapReduce jobs.

For example:

Finding the average sales per city may require:

- Job 1 → Calculate total sales
- Job 2 → Count records
- Job 3 → Calculate average

Spark performs the same task in a single DataFrame query.

---

### 5. High Latency

MapReduce is mainly designed for batch processing.

It is not suitable for:

- Live dashboards
- Real-time analytics
- Streaming applications
- Interactive SQL queries

Spark supports both batch and real-time processing.

---

### 6. Limited Libraries

MapReduce mainly provides Map and Reduce operations.

Spark provides several built-in libraries:

- Spark SQL
- MLlib
- GraphX
- Structured Streaming
- DataFrame API

These libraries reduce development effort.

---

### 7. Difficult Code Maintenance

Writing MapReduce programs generally requires more lines of Java code.

Spark DataFrames provide a simpler and more readable API.

Example:

Instead of writing hundreds of lines of Java code, Spark allows developers to perform the same operation in just a few lines of PySpark code.

---

## Advantages of Spark over MapReduce

| Hadoop MapReduce      | Apache Spark                        |
| --------------------- | ----------------------------------- |
| Disk-based processing | In-memory processing                |
| Slow execution        | Fast execution                      |
| Batch processing only | Batch + Streaming                   |
| Complex programming   | Simple DataFrame API                |
| Limited libraries     | Rich ecosystem (SQL, MLlib, GraphX) |
| High latency          | Low latency                         |
| More disk I/O         | Minimal disk I/O                    |

---

## Features of Apache Spark

- In-memory computing
- Distributed processing
- Fault tolerance
- Lazy evaluation
- DataFrame API
- Machine Learning support
- SQL support
- Streaming support
- Graph processing

---

## Real-World Example

Suppose Netflix wants to recommend movies to users.

The recommendation algorithm processes user ratings hundreds of times.

### Using MapReduce

Every iteration:

```
Read from Disk
      ↓
Process
      ↓
Write to Disk
```

Repeated hundreds of times.

### Using Spark

```
Read Data Once
      ↓
Store in RAM
      ↓
Run Hundreds of Iterations
      ↓
Write Final Output
```

Spark completes the task much faster because it avoids repeated disk operations.

---

## Advantages

- Faster execution
- Reduced disk I/O
- Easy programming
- Better scalability
- Supports iterative algorithms
- Suitable for real-time analytics
- Rich libraries
- Supports multiple programming languages

---

## Disadvantages of MapReduce

- Slow processing
- High disk usage
- Complex code
- Poor iterative performance
- High latency
- Limited APIs

---

## Conclusion

Apache Spark overcomes the major limitations of Hadoop MapReduce by using in-memory computing, simplified APIs, and optimized execution. It provides significantly better performance for machine learning, streaming, graph processing, and interactive analytics, making it the preferred framework for modern big data applications.

---

# Q2. Explain how Spark uses In-Memory Computing to speed up iterative machine learning algorithms compared to disk-based systems.

## Definition

**In-Memory Computing** is a computing technique where data is stored and processed in the computer's RAM (Random Access Memory) instead of repeatedly reading and writing it from disk.

Apache Spark uses this concept to improve processing speed significantly.

---

## Explanation

Traditional systems like Hadoop MapReduce write intermediate results to disk after every processing stage.

Disk access is much slower than RAM.

Spark stores intermediate datasets in memory and reuses them whenever required.

This is especially beneficial for Machine Learning algorithms because they repeatedly access the same data.

---

## Why Machine Learning Requires Multiple Iterations

Machine Learning algorithms improve their predictions by repeatedly processing the same dataset.

Examples include:

- Linear Regression
- Logistic Regression
- K-Means Clustering
- Neural Networks

These algorithms may execute hundreds of iterations before reaching the optimal result.

---

## MapReduce Workflow

```
Read Data
     ↓
Iteration 1
     ↓
Write to Disk
     ↓
Read Again
     ↓
Iteration 2
     ↓
Write Again
```

This process continues for every iteration.

---

## Spark Workflow

```
Read Data Once
      ↓
Store in Memory
      ↓
Iteration 1
      ↓
Iteration 2
      ↓
Iteration 3
      ↓
Final Output
```

No repeated disk access occurs.

---

## How Spark Achieves High Performance

Spark uses several optimization techniques:

### 1. RAM Storage

Intermediate results remain in memory.

### 2. Caching

Frequently used DataFrames can be cached.

Example:

```python
df.cache()
```

### 3. Lazy Evaluation

Spark delays execution until an action is called.

This reduces unnecessary computations.

### 4. DAG Scheduler

Spark combines multiple transformations into an optimized execution plan.

---

## Advantages of In-Memory Computing

- Extremely fast processing
- Reduced disk I/O
- Better CPU utilization
- Faster Machine Learning training
- Faster iterative processing
- Better interactive analytics

---

## Disadvantages

- Requires more RAM
- Higher memory cost
- Large datasets may exceed available memory
- Memory management becomes important

---

## Real-World Example

Suppose an online shopping company trains a recommendation model using customer purchase history.

The algorithm performs 150 iterations.

### MapReduce

```
150 Disk Reads
150 Disk Writes
```

### Spark

```
1 Disk Read
149 Memory Reads
1 Final Write
```

Spark dramatically reduces execution time.

---

## PySpark Example

```python
# Cache DataFrame in memory

df.cache()

# Perform iterative operations

for i in range(5):
    df.groupBy("category").count().show()
```

---

## Expected Output

```
Category     Count
Electronics   1200
Clothing       850
Books          620
```

Spark performs subsequent iterations using cached memory.

---

## Conclusion

Apache Spark's in-memory computing significantly improves performance by reducing expensive disk operations. It is particularly beneficial for machine learning, graph analytics, and iterative algorithms where the same data is processed multiple times.

---

# Q3. Write a code snippet to remove all duplicate rows from a DataFrame based on a specific set of columns: user_id and transaction_date.

## Definition

Duplicate records are rows that contain identical values in one or more columns.

Data cleaning often requires removing duplicates to ensure accurate analysis.

Spark provides the `dropDuplicates()` method for this purpose.

---

## Explanation

Sometimes, the same transaction is accidentally recorded multiple times.

For example:

| user_id | transaction_date | Amount |
| ------- | ---------------- | ------ |
| 101     | 2025-01-01       | 500    |
| 101     | 2025-01-01       | 500    |
| 102     | 2025-01-03       | 700    |

The first two rows represent duplicate transactions.

Removing duplicates improves data quality.

---

## PySpark Code

```python
df_clean = df.dropDuplicates(["user_id", "transaction_date"])
```

---

## How It Works

- Spark checks the values of `user_id` and `transaction_date`.
- If multiple rows have the same values for these columns, only one row is retained.
- The remaining duplicate rows are removed.

---

## Example Output

### Before Cleaning

| user_id | transaction_date | Amount |
| ------- | ---------------- | ------ |
| 101     | 2025-01-01       | 500    |
| 101     | 2025-01-01       | 500    |
| 102     | 2025-01-03       | 700    |

### After Cleaning

| user_id | transaction_date | Amount |
| ------- | ---------------- | ------ |
| 101     | 2025-01-01       | 500    |
| 102     | 2025-01-03       | 700    |

---

## Advantages

- Removes redundant records.
- Improves data quality.
- Prevents incorrect aggregations.
- Reduces storage requirements.

---

## Insight

Removing duplicate records before analysis ensures that reports, statistics, and machine learning models are based on accurate and unique data.

---

# Q4. Given a DataFrame `df_sales`, write a query to filter for rows where the region is 'West' and then group by `product_category` to find the average `sale_amount`.

## Definition

Filtering selects only the rows that satisfy a specified condition.

Grouping organizes rows with common values into categories.

Aggregation computes summary statistics such as average, sum, minimum, maximum, or count.

---

## Explanation

Suppose a company has sales data from multiple regions.

Management wants to analyze only the **West** region and calculate the average sales for each product category.

This requires three operations:

1. Filter rows where region is "West".
2. Group records by `product_category`.
3. Calculate the average `sale_amount`.

---

## PySpark Code

```python
from pyspark.sql.functions import avg

result = (
    df_sales
    .filter(df_sales.region == "West")
    .groupBy("product_category")
    .agg(avg("sale_amount").alias("average_sale"))
)

result.show()
```

---

## Example Dataset

| Region | Product Category | Sale Amount |
| ------ | ---------------- | ----------- |
| West   | Electronics      | 500         |
| West   | Electronics      | 700         |
| West   | Furniture        | 300         |
| East   | Furniture        | 400         |

---

## Expected Output

| Product Category | Average Sale |
| ---------------- | ------------ |
| Electronics      | 600          |
| Furniture        | 300          |

---

## Explanation of Code

- `filter()` selects only West region records.
- `groupBy()` groups data by product category.
- `avg()` calculates the average sale amount.
- `alias()` renames the resulting column.

---

## Advantages

- Simplifies regional analysis.
- Produces category-wise insights.
- Supports business decision-making.
- Enables efficient reporting.

---

## Real-World Example

A retail company wants to compare average sales across different product categories in the West region to identify high-performing products and improve inventory planning.

---

## Insight

Combining filtering with grouping and aggregation allows organizations to extract meaningful insights from large datasets efficiently. These operations are commonly used in business intelligence, sales analysis, and reporting.

# Q5. What is the difference between `.na.drop()` and `.na.fill()`? Provide a code example of filling null values in a `status` column with the string `'Unknown'`.

## Definition

In real-world datasets, **missing values (null values)** are very common. Missing values can occur due to various reasons such as incomplete data entry, system failures, incorrect imports, or unavailable information. Before performing analysis or machine learning, these null values should be handled appropriately.

Apache Spark provides the **DataFrameNaFunctions** (`.na`) class to handle missing values efficiently. Two commonly used methods are:

- **`.na.drop()`** – Removes rows containing null values.
- **`.na.fill()`** – Replaces null values with a specified value.

---

## Difference Between `.na.drop()` and `.na.fill()`

| `.na.drop()`                              | `.na.fill()`                                                           |
| ----------------------------------------- | ---------------------------------------------------------------------- |
| Removes rows containing null values.      | Replaces null values with a specified value.                           |
| Data is permanently removed.              | Data is preserved by replacing missing values.                         |
| Used when missing records are not useful. | Used when missing values can be estimated or assigned a default value. |
| May reduce dataset size.                  | Keeps the dataset size unchanged.                                      |
| Suitable for highly incomplete records.   | Suitable when maintaining all records is important.                    |

---

## Explanation

### 1. `.na.drop()`

This method removes rows that contain one or more null values.

### Syntax

```python
df = df.na.drop()
```

Example:

| ID  | Name  | Salary |
| --- | ----- | ------ |
| 1   | Alice | 50000  |
| 2   | NULL  | 60000  |
| 3   | John  | NULL   |

After `.na.drop()`:

| ID  | Name  | Salary |
| --- | ----- | ------ |
| 1   | Alice | 50000  |

Rows containing null values are removed.

---

### 2. `.na.fill()`

Instead of removing rows, Spark replaces null values with a user-defined value.

### Syntax

```python
df = df.na.fill(value)
```

This helps preserve valuable records.

---

## PySpark Code

Replace null values in the **status** column with **"Unknown"**.

```python
df = df.na.fill({"status": "Unknown"})
```

---

## Complete Example

### Input Data

| employee_id | status   |
| ----------- | -------- |
| 101         | Active   |
| 102         | NULL     |
| 103         | Inactive |
| 104         | NULL     |

### Code

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("NullHandling").getOrCreate()

df = df.na.fill({"status": "Unknown"})

df.show()
```

### Output

| employee_id | status   |
| ----------- | -------- |
| 101         | Active   |
| 102         | Unknown  |
| 103         | Inactive |
| 104         | Unknown  |

---

## Advantages of `.na.fill()`

- Preserves all records.
- Prevents loss of important information.
- Improves data quality.
- Prevents errors during analysis.
- Suitable for categorical data.

---

## Advantages of `.na.drop()`

- Removes incomplete records.
- Produces cleaner datasets.
- Useful when null values are very high.

---

## Real-World Example

Suppose an HR company has employee records.

Some employees have missing employment status.

Instead of deleting these employees, the HR department replaces missing values with **"Unknown"** until the correct information is available.

---

## Best Practice

- Use **`.na.fill()`** when missing values can reasonably be replaced.
- Use **`.na.drop()`** only when missing records have little analytical value.

---

## Conclusion

Handling null values is a critical step in data cleaning. While `.na.drop()` removes incomplete records, `.na.fill()` preserves the dataset by replacing missing values. Choosing the correct method depends on the business requirement and the quality of the available data.

---

# Q6. Write a query to find the total count of records for each city in a DataFrame, but only for cities where the count is greater than 100.

## Definition

**Grouping** is the process of organizing records that share a common value into categories. After grouping, aggregation functions such as `count()`, `sum()`, `avg()`, `min()`, and `max()` can be applied to each group.

The `groupBy()` function in Spark DataFrames is commonly used to perform grouping operations.

---

## Problem Statement

We need to:

1. Group records based on the **city** column.
2. Count the number of records for each city.
3. Display only those cities whose count is greater than **100**.

---

## PySpark Code

```python
from pyspark.sql.functions import count

result = (
    df.groupBy("city")
      .agg(count("*").alias("total_records"))
      .filter("total_records > 100")
)

result.show()
```

---

## Explanation of the Code

### Step 1

```python
groupBy("city")
```

Groups all records according to the city.

---

### Step 2

```python
count("*")
```

Counts the number of records in each city.

---

### Step 3

```python
filter("total_records > 100")
```

Displays only cities having more than 100 records.

---

## Sample Dataset

| city   |
| ------ |
| Pune   |
| Mumbai |
| Pune   |
| Delhi  |
| Mumbai |
| Pune   |

Suppose after grouping:

| city   | total_records |
| ------ | ------------- |
| Pune   | 145           |
| Mumbai | 110           |
| Delhi  | 80            |

### Final Output

| city   | total_records |
| ------ | ------------- |
| Pune   | 145           |
| Mumbai | 110           |

Delhi is removed because it has fewer than 100 records.

---

## Advantages

- Produces summarized reports.
- Helps identify high-volume locations.
- Useful for business analytics.
- Easy to combine with aggregation functions.

---

## Real-World Example

An e-commerce company wants to know which cities have more than 100 registered customers.

This helps management identify major markets for advertising campaigns.

---

## Conclusion

Grouping and aggregation help transform raw datasets into meaningful summaries. Filtering aggregated results enables analysts to focus only on significant groups.

---

# Q7. How does the immutability of Spark DataFrames affect how you perform "data cleaning" steps like dropping columns or renaming them?

## Definition

A **Spark DataFrame is immutable**, meaning that once it is created, its data cannot be modified directly.

Instead of changing an existing DataFrame, Spark creates a **new DataFrame** whenever an operation is performed.

---

## Explanation

Unlike spreadsheets where values can be edited directly, Spark DataFrames remain unchanged after creation.

Every transformation returns a new DataFrame.

Example:

```python
df_new = df.drop("salary")
```

The original DataFrame `df` still contains the **salary** column.

The new DataFrame `df_new` does not.

---

## Why Spark Uses Immutability

Immutability provides several benefits:

- Fault tolerance
- Easier debugging
- Safe parallel execution
- Efficient optimization
- Prevents accidental data modification

---

## Dropping a Column

### Code

```python
df_new = df.drop("salary")
```

---

## Renaming a Column

### Code

```python
df_new = df.withColumnRenamed("emp_name", "employee_name")
```

---

## Example

### Original DataFrame

| ID  | emp_name | salary |
| --- | -------- | ------ |
| 1   | Alice    | 50000  |
| 2   | Bob      | 60000  |

---

### After Dropping Salary

| ID  | emp_name |
| --- | -------- |
| 1   | Alice    |
| 2   | Bob      |

---

### After Renaming

| ID  | employee_name | salary |
| --- | ------------- | ------ |
| 1   | Alice         | 50000  |
| 2   | Bob           | 60000  |

---

## Advantages of Immutability

- Prevents accidental data corruption.
- Enables distributed processing.
- Supports fault recovery.
- Makes debugging easier.
- Allows Spark to optimize execution plans.

---

## Disadvantages

- Creates additional DataFrame objects.
- Slightly higher memory usage in some cases.

However, Spark's optimizer minimizes this overhead.

---

## Real-World Example

A bank processes millions of customer transactions daily.

If multiple users modify the same dataset simultaneously, inconsistencies could occur.

Immutability ensures that every transformation creates a new version without affecting the original data.

---

## Conclusion

Immutability is one of the core principles of Spark. It improves reliability, fault tolerance, and parallel processing by ensuring that original datasets remain unchanged throughout the data processing pipeline.

---

# Q8. Write a Spark command to filter a dataset for rows where the age is between 18 and 30 (inclusive) and the subscription is 'Premium'.

## Definition

Filtering is the process of selecting only those records that satisfy specified conditions.

Spark provides the `filter()` and `where()` methods to retrieve relevant records from a DataFrame.

---

## Problem Statement

Retrieve records where:

- Age is between **18 and 30** (inclusive)
- Subscription type is **Premium**

---

## PySpark Code

```python
result = df.filter(
    (df.age >= 18) &
    (df.age <= 30) &
    (df.subscription == "Premium")
)

result.show()
```

---

## Alternative Syntax

```python
result = df.where(
    (df.age.between(18, 30)) &
    (df.subscription == "Premium")
)

result.show()
```

---

## Explanation of the Code

### Condition 1

```python
df.age >= 18
```

Selects users aged 18 years or above.

---

### Condition 2

```python
df.age <= 30
```

Selects users up to 30 years old.

---

### Condition 3

```python
df.subscription == "Premium"
```

Selects only Premium subscribers.

---

### Logical AND (`&`)

The `&` operator ensures that **all conditions** must be true.

---

## Sample Input

| Name  | Age | Subscription |
| ----- | --- | ------------ |
| Alice | 22  | Premium      |
| Bob   | 19  | Basic        |
| John  | 28  | Premium      |
| Sam   | 35  | Premium      |

---

## Expected Output

| Name  | Age | Subscription |
| ----- | --- | ------------ |
| Alice | 22  | Premium      |
| John  | 28  | Premium      |

Bob is excluded because the subscription is Basic.

Sam is excluded because age is greater than 30.

---

## Advantages

- Retrieves only relevant records.
- Improves query performance.
- Reduces unnecessary processing.
- Useful before aggregation and analysis.

---

## Real-World Example

A music streaming company wants to analyze Premium users between the ages of 18 and 30 to understand listening habits and recommend personalized playlists.

Using filtering helps the company focus only on the target customer segment.

---

## Conclusion

Filtering is one of the most frequently used transformations in Spark. Applying conditions before performing expensive operations such as grouping or aggregation reduces the amount of data processed and improves overall performance.

# Q9. When cleaning a dataset, why is it often better to handle null values before performing mathematical aggregations like `sum()` or `avg()`?

## Definition

**Null values** represent missing, unknown, or unavailable data in a dataset. These values can arise due to incomplete data collection, system failures, manual entry errors, or missing information from the data source.

**Aggregation functions** such as `sum()`, `avg()`, `count()`, `min()`, and `max()` are mathematical operations used to summarize data.

Before performing aggregation, it is considered a best practice to clean or handle null values to ensure accurate and meaningful results.

---

## Why Should Null Values Be Handled Before Aggregation?

Aggregation functions rely on valid numerical data. If null values are present, they can lead to incorrect calculations or misleading insights.

For example:

- Average salary may appear lower or higher than the actual value.
- Total sales may not represent the complete revenue.
- Reports may become inconsistent.
- Machine learning models may produce inaccurate predictions.

Therefore, null values should either be **removed** or **replaced** before aggregation.

---

## Problems Caused by Null Values

### 1. Incorrect Calculations

If important numerical values are missing, the calculated statistics may not represent the actual dataset.

Example:

| Employee | Salary |
| -------- | ------ |
| A        | 50000  |
| B        | 60000  |
| C        | NULL   |

If the missing salary actually should have been **70000**, the average salary calculated from only two employees would not represent reality.

---

### 2. Misleading Business Decisions

Business reports generated using incomplete data may lead to incorrect decisions.

Example:

A company calculates total monthly sales.

If several sales records contain null values, the reported revenue becomes lower than the actual revenue.

---

### 3. Errors in Machine Learning Models

Many machine learning algorithms cannot process null values directly.

Examples include:

- Linear Regression
- Logistic Regression
- Decision Trees
- K-Means Clustering

Null values often need preprocessing before model training.

---

### 4. Inconsistent Reports

Different reports may produce different results if null values are handled inconsistently.

Maintaining a standard null-handling strategy ensures consistency.

---

## Methods to Handle Null Values

### Method 1: Remove Null Values

```python
df = df.na.drop()
```

This removes rows containing null values.

---

### Method 2: Replace Null Values

```python
df = df.na.fill({"price": 0})
```

This replaces missing values with 0.

---

### Method 3: Replace with Mean or Median

For numerical columns, missing values are often replaced with the average or median value.

Example:

```python
average_price = 500

df = df.na.fill({"price": average_price})
```

---

## Example

### Original Dataset

| Product | Price |
| ------- | ----: |
| Laptop  | 60000 |
| Phone   | 25000 |
| Tablet  |  NULL |

---

### After Filling Null Values

| Product | Price |
| ------- | ----: |
| Laptop  | 60000 |
| Phone   | 25000 |
| Tablet  |     0 |

---

### Aggregation

```python
from pyspark.sql.functions import sum

df.groupBy().sum("price").show()
```

---

## Advantages

- Produces accurate calculations.
- Improves data quality.
- Prevents misleading reports.
- Enhances machine learning performance.
- Maintains consistency across analyses.

---

## Real-World Example

A retail company generates a monthly sales report.

Some sales transactions have missing prices.

If these null values are ignored, the company's reported revenue will be inaccurate.

Replacing missing prices appropriately before aggregation ensures correct financial reporting.

---

## Conclusion

Handling null values before performing aggregation is an essential step in data cleaning. It improves data quality, ensures accurate calculations, and enables reliable business intelligence and machine learning applications.

---

# Q10. Write the code to revise a column named `raw_timestamp` by casting it to a `TimestampType` and renaming it to `event_time`.

## Definition

In Spark, **casting** is the process of converting a column from one data type to another.

A **TimestampType** stores both the date and time in a standardized format, making it suitable for time-based analysis.

---

## Why Cast a Timestamp?

Many datasets store timestamps as plain strings.

Example:

```
"2025-07-18 10:30:45"
```

Although this looks like a timestamp, Spark treats it as a string.

This limits operations such as:

- Sorting by time
- Calculating time differences
- Time-based filtering
- Window functions

Casting converts the string into an actual timestamp data type.

---

## PySpark Code

```python
from pyspark.sql.types import TimestampType

df = (
    df.withColumn(
        "event_time",
        df.raw_timestamp.cast(TimestampType())
    )
    .drop("raw_timestamp")
)

df.show()
```

---

## Explanation

### Step 1

```python
cast(TimestampType())
```

Converts the string into Timestamp format.

---

### Step 2

```python
withColumn("event_time", ...)
```

Creates a new column called **event_time**.

---

### Step 3

```python
drop("raw_timestamp")
```

Removes the original string column.

---

## Example

### Before

| raw_timestamp       |
| ------------------- |
| 2025-07-18 10:30:45 |

---

### After

| event_time          |
| ------------------- |
| 2025-07-18 10:30:45 |

Although the displayed values look the same, the datatype has changed from **StringType** to **TimestampType**.

---

## Advantages

- Enables time-based analytics.
- Improves query performance.
- Supports date and time functions.
- Simplifies filtering and sorting.

---

## Real-World Example

An online shopping website stores order timestamps as text.

Before analyzing order trends by hour or day, the timestamp must be converted into `TimestampType`.

---

## Conclusion

Casting timestamp columns improves data quality and enables advanced time-based analytics in Spark.

---

# Q11. Explain the "Shuffle" process that occurs during a grouping operation. Why is it considered a wide transformation?

## Definition

**Shuffle** is the process of redistributing data across different partitions in a Spark cluster.

It occurs whenever Spark needs to reorganize data so that similar values are placed together.

Operations such as:

- groupBy()
- join()
- reduceByKey()
- distinct()

trigger a shuffle.

---

## What Happens During Shuffle?

Suppose the data is distributed across several partitions.

```
Partition 1
Apple
Banana

Partition 2
Apple
Orange

Partition 3
Banana
Apple
```

If we execute

```python
groupBy("Fruit")
```

Spark moves all "Apple" records to one partition, all "Banana" records to another, and so on.

```
Partition A
Apple
Apple
Apple

Partition B
Banana
Banana

Partition C
Orange
```

This movement of data between partitions is called **Shuffle**.

---

## Why is Shuffle Needed?

Grouping requires all identical keys to be together.

Without shuffling, Spark cannot correctly calculate:

- Count
- Sum
- Average
- Maximum
- Minimum

---

## Why is Shuffle a Wide Transformation?

Spark transformations are divided into two categories.

### Narrow Transformation

Data remains in the same partition.

Examples:

- filter()
- map()
- select()

---

### Wide Transformation

Data moves between different partitions.

Examples:

- groupBy()
- join()
- distinct()

Since shuffle transfers data across partitions, it is classified as a **wide transformation**.

---

## Advantages

- Enables grouping and aggregation.
- Allows distributed computation.
- Produces accurate results across partitions.

---

## Disadvantages

- High network communication.
- Increased disk I/O.
- Slower execution.
- Higher memory consumption.

---

## Real-World Example

A company wants total sales for each city.

Sales records are distributed across multiple partitions.

Spark performs a shuffle so that all records belonging to the same city are brought together before calculating total sales.

---

## Conclusion

Shuffle is an essential operation for grouping and aggregation in Spark. Although it is computationally expensive, it enables accurate distributed processing and is therefore considered a wide transformation.

---

# Q12. Write a code snippet that identifies and removes rows where the `email` column contains null values OR the `username` is an empty string.

## Definition

Data cleaning involves removing incomplete or invalid records from a dataset.

Common issues include:

- Null values
- Empty strings
- Duplicate records
- Incorrect data types

Cleaning these records improves data quality and analysis accuracy.

---

## Problem Statement

Remove records where:

- email is NULL
- username is an empty string

---

## PySpark Code

```python
result = df.filter(
    (df.email.isNotNull()) &
    (df.username != "")
)

result.show()
```

---

## Explanation

### Condition 1

```python
df.email.isNotNull()
```

Keeps only records where email is available.

---

### Condition 2

```python
df.username != ""
```

Removes records where the username is blank.

---

### Logical AND (`&`)

Both conditions must be true.

Only valid records remain.

---

## Example Dataset

### Before Cleaning

| email          | username |
| -------------- | -------- |
| abc@gmail.com  | Alice    |
| NULL           | Bob      |
| xyz@gmail.com  | ""       |
| john@gmail.com | John     |

---

### After Cleaning

| email          | username |
| -------------- | -------- |
| abc@gmail.com  | Alice    |
| john@gmail.com | John     |

---

## Advantages

- Improves data quality.
- Removes incomplete records.
- Prevents errors during analysis.
- Improves machine learning accuracy.
- Produces reliable reports.

---

## Real-World Example

A social media company requires every user to have:

- a valid email address
- a valid username

Incomplete registrations are removed before generating user analytics.

---

## Best Practice

Instead of cleaning data after every analysis, data engineers generally perform data cleaning once during the ETL (Extract, Transform, Load) process. This ensures that all downstream analytics and machine learning models work with clean and reliable data.

---

## Conclusion

Removing records with null email addresses or empty usernames improves dataset quality and ensures that future analyses, reports, and machine learning models are based on valid and complete information.

# Q13. How do you use the `.agg()` function to calculate multiple statistics at once, such as the minimum, maximum, and mean of the `price` column?

## Definition

The **`.agg()` (aggregate)** function in Apache Spark is used to perform one or more aggregate calculations on a DataFrame. Instead of executing multiple queries separately, `.agg()` allows several statistical calculations to be performed in a single operation.

Some commonly used aggregation functions include:

- `sum()` – Calculates the total value.
- `count()` – Counts the number of records.
- `avg()` or `mean()` – Calculates the average value.
- `min()` – Finds the smallest value.
- `max()` – Finds the largest value.

Using `.agg()` improves efficiency by reducing the number of transformations and making the code easier to read.

---

## Why Use `.agg()`?

Instead of writing separate queries for each statistic:

```python
df.select(min("price"))
df.select(max("price"))
df.select(mean("price"))
```

Spark can calculate all of them together using one `.agg()` statement.

This reduces processing time and improves code readability.

---

## PySpark Code

```python
from pyspark.sql.functions import min, max, mean

result = df.agg(
    min("price").alias("Minimum Price"),
    max("price").alias("Maximum Price"),
    mean("price").alias("Average Price")
)

result.show()
```

---

## Explanation of the Code

### Step 1

```python
min("price")
```

Finds the minimum value in the **price** column.

---

### Step 2

```python
max("price")
```

Finds the maximum value.

---

### Step 3

```python
mean("price")
```

Calculates the average value.

---

### Step 4

```python
.alias()
```

Assigns meaningful names to the output columns.

---

## Sample Dataset

| Product | Price |
| ------- | ----: |
| Laptop  | 60000 |
| Phone   | 25000 |
| Tablet  | 35000 |
| Monitor | 18000 |

---

## Expected Output

| Minimum Price | Maximum Price | Average Price |
| ------------- | ------------: | ------------: |
| 18000         |         60000 |         34500 |

---

## Advantages

- Performs multiple calculations in one query.
- Improves execution efficiency.
- Reduces code complexity.
- Generates concise statistical summaries.
- Easy to combine with `groupBy()`.

---

## Real-World Example

A supermarket wants to analyze product prices.

Using `.agg()`, it can quickly determine:

- Cheapest product
- Most expensive product
- Average product price

This information helps management make pricing decisions and identify pricing trends.

---

## Best Practice

When multiple aggregate statistics are required, use `.agg()` instead of writing separate aggregation queries. This reduces computation and makes the code cleaner.

---

## Conclusion

The `.agg()` function is a powerful Spark DataFrame operation that allows multiple aggregate calculations to be performed simultaneously. It improves performance, reduces code duplication, and provides comprehensive statistical summaries of the data.

---

# Q14. In the context of cleaning a dataset, what is the risk of using `inferSchema=true` when your source data contains messy or inconsistent date formats?

## Definition

When loading data into Spark, the **`inferSchema=true`** option instructs Spark to automatically determine the data type of each column instead of treating every column as a string.

Example:

```python
df = spark.read.csv(
    "sales.csv",
    header=True,
    inferSchema=True
)
```

Although automatic schema inference is convenient, it can create problems when the dataset contains inconsistent or messy data.

---

## What is Schema Inference?

Schema inference is Spark's process of examining the dataset and assigning data types such as:

- IntegerType
- DoubleType
- StringType
- BooleanType
- DateType
- TimestampType

This process works well when the dataset follows a consistent format.

---

## Risk of Using `inferSchema=true`

When date formats are inconsistent, Spark may infer an incorrect data type.

Example dataset:

| Order Date    |
| ------------- |
| 2025-07-18    |
| 18/07/2025    |
| July 18, 2025 |
| NULL          |

These dates use different formats.

Spark may:

- Treat the entire column as `StringType`.
- Fail to parse some values.
- Produce null values.
- Generate incorrect results.

---

## Problems Caused by Inconsistent Date Formats

### 1. Incorrect Data Type

Instead of assigning `DateType`, Spark may assign `StringType`.

This prevents date operations.

---

### 2. Parsing Errors

Some date values may not match Spark's expected format.

These records may become null after conversion.

---

### 3. Incorrect Sorting

Dates stored as strings are sorted alphabetically instead of chronologically.

Example:

```
01/12/2025
15/01/2025
20/02/2025
```

Alphabetical sorting does not represent the correct chronological order.

---

### 4. Failed Date Calculations

Operations such as:

- Date Difference
- Month Extraction
- Year Extraction
- Timestamp Comparison

require proper date data types.

---

### 5. Data Quality Issues

Incorrect schema inference can hide data quality problems until later stages of processing.

---

## Better Approach

Instead of relying completely on `inferSchema=true`, define the schema manually.

Example:

```python
from pyspark.sql.types import *

schema = StructType([
    StructField("order_id", IntegerType(), True),
    StructField("order_date", DateType(), True),
    StructField("amount", DoubleType(), True)
])

df = spark.read.csv(
    "sales.csv",
    header=True,
    schema=schema
)
```

Manual schemas provide greater control and consistency.

---

## Advantages of Manual Schema

- Better data quality.
- Faster data loading.
- Consistent data types.
- Reduced parsing errors.
- Easier debugging.

---

## Real-World Example

A hospital receives patient records from multiple clinics.

One clinic stores dates as:

```
2025-07-18
```

Another stores:

```
18-07-2025
```

Another stores:

```
07/18/2025
```

Using `inferSchema=true` may produce incorrect data types.

Defining the schema manually ensures consistent processing across all records.

---

## Best Practice

Use `inferSchema=true` only for small or clean datasets.

For production environments and business-critical applications, define the schema explicitly.

---

## Conclusion

Although `inferSchema=true` simplifies data loading, it can introduce incorrect data types when datasets contain inconsistent formats. Defining the schema manually provides better accuracy, consistency, and reliability.

---

# Q15. Write a final processing pipeline that:

- Filters out duplicates.
- Fills null prices with 0.
- Groups by `store_id` to calculate total revenue.

---

## Definition

A **data processing pipeline** is a sequence of transformations applied to raw data to produce clean, structured, and meaningful information.

In Spark, multiple transformations can be chained together to build an efficient and readable processing workflow.

---

## Objective

The pipeline should:

1. Remove duplicate records.
2. Replace null values in the `price` column with 0.
3. Group records by `store_id`.
4. Calculate the total revenue for each store.

---

## PySpark Code

```python
from pyspark.sql.functions import sum

result = (
    df
    .dropDuplicates()
    .na.fill({"price": 0})
    .groupBy("store_id")
    .agg(sum("price").alias("total_revenue"))
)

result.show()
```

---

## Explanation of the Pipeline

### Step 1 – Remove Duplicate Records

```python
.dropDuplicates()
```

Removes duplicate rows from the dataset.

This improves data quality and prevents duplicate calculations.

---

### Step 2 – Handle Missing Values

```python
.na.fill({"price": 0})
```

Replaces null values in the **price** column with **0**.

This ensures that aggregation functions work correctly.

---

### Step 3 – Group Data

```python
.groupBy("store_id")
```

Groups records according to each store.

---

### Step 4 – Calculate Revenue

```python
.agg(sum("price").alias("total_revenue"))
```

Calculates the total revenue generated by each store.

---

## Sample Dataset

| Store ID | Price |
| -------- | ----: |
| 101      |   500 |
| 101      |   700 |
| 102      |  NULL |
| 102      |   300 |
| 101      |   500 |

---

### After Removing Duplicates

| Store ID | Price |
| -------- | ----: |
| 101      |   500 |
| 101      |   700 |
| 102      |  NULL |
| 102      |   300 |

---

### After Filling Null Values

| Store ID | Price |
| -------- | ----: |
| 101      |   500 |
| 101      |   700 |
| 102      |     0 |
| 102      |   300 |

---

### Final Output

| Store ID | Total Revenue |
| -------- | ------------: |
| 101      |          1200 |
| 102      |           300 |

---

## Advantages

- Improves data quality.
- Removes duplicate records.
- Handles missing values.
- Produces accurate business reports.
- Combines multiple transformations into a single pipeline.
- Improves readability and maintainability of code.

---

## Real-World Example

A retail company receives daily sales data from multiple stores.

Before generating the daily revenue report, the data engineering team:

- Removes duplicate transactions.
- Replaces missing prices with 0.
- Groups transactions by store.
- Calculates total revenue for each store.

The cleaned and aggregated data is then used by management to monitor store performance and make business decisions.

---

## Best Practice

Always perform data cleaning before aggregation. Chaining transformations into a single pipeline improves code readability, optimizes execution through Spark's lazy evaluation, and simplifies maintenance.
