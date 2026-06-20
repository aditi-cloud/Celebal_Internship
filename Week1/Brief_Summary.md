# Assignment 1: Data Exploration and Cleaning Using Pandas

## Student Information

**Name:** Aditi Gaikwad
**Course:** MCA
**Institute:** MIT-WPU

## Objective

The objective of this assignment is to learn Python basics and perform data exploration and data cleaning using the Pandas library.

## Tasks Performed

### 1. Load Dataset

- Imported the required libraries (`pandas`).
- Loaded the CSV dataset into a Pandas DataFrame.

### 2. Explore the Data

- Displayed the first and last few rows using `head()` and `tail()`.
- Checked the shape of the dataset.
- Viewed column names and data types.
- Examined the overall structure of the dataset.

### 3. Handle Missing Values

- Identified missing values using `isnull().sum()`.
- Replaced missing values with appropriate default values such as:
  - `0` for numeric columns.
  - `"Unknown"` or `"Not Available"` for text-based columns.

- Verified that missing values were handled successfully.

### 4. Filter Rows and Select Columns

- Selected relevant columns required for analysis.
- Applied row filtering based on specific conditions to extract meaningful records.

### 5. Remove Duplicate Records

- Identified duplicate entries using the `product_id` column.
- Removed duplicate records while retaining unique products.

### 6. Create a Derived Column

- Created a new column named `total_amount`.
- Calculated the value using:

```python
total_amount = price * quantity
```

- Since the original dataset did not contain a quantity column, a sample quantity column was created for demonstration purposes.

### 7. Save Cleaned Dataset

- Exported the cleaned DataFrame to a new CSV file using `to_csv()`.
- Saved the processed dataset for future analysis.
