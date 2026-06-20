# Shopping Analysis: Exploratory Data Analysis and Data Cleaning

## Student Information

**Name:** Aditi Gaikwad
**Course:** MCA
**Institute:** MIT-WPU

---

## Project Overview

This project focuses on performing Exploratory Data Analysis (EDA), data cleaning, feature engineering, and visualization on an e-commerce product dataset. The objective is to understand product performance, pricing patterns, customer ratings, and category-level trends while preparing the dataset for further analytical tasks.

---

## Dataset

**Dataset Used:** `combined_dataset.csv`

The dataset contains product-level information including:

- Product ID
- Product Title
- Product Description
- Ratings
- Ratings Count
- Initial Price
- Final Price
- Discount
- Category
- Seller Information
- Customer Reviews
- Product Specifications

---

## Objectives

The primary objectives of this project were:

1. Load and explore the dataset using Pandas.
2. Understand data structure, data types, and missing values.
3. Clean and preprocess the dataset.
4. Create new features for analysis.
5. Perform univariate, bivariate, and category-level analysis.
6. Visualize trends and patterns using charts.
7. Generate meaningful business insights and recommendations.

---

## Tools and Libraries Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

---

## Data Cleaning Process

The following preprocessing steps were performed:

### Missing Value Treatment

- Identified missing values using `isnull().sum()`.
- Filled missing categorical fields with meaningful placeholders.
- Replaced missing numerical values where appropriate.

### Duplicate Removal

- Removed duplicate records based on `product_id`.
- Ensured each product appeared only once in the cleaned dataset.

### Data Type Conversion

- Converted price-related columns into numeric format.
- Ensured correct data types for analysis and visualization.

---

## Feature Engineering

Two additional features were created:

### 1. Price Difference

```python
price_difference = initial_price - final_price
```

This feature measures the discount amount applied to each product.

### 2. Popularity Metric

```python
popularity_metric = rating * ratings_count
```

This metric combines product ratings and customer engagement to estimate overall popularity.

---

## Exploratory Data Analysis

### Univariate Analysis

Performed analysis on:

- Product ratings
- Initial prices
- Final prices
- Discounts
- Popularity metric

Visualizations Used:

- Histograms
- Boxplots

### Bivariate Analysis

Analyzed relationships between:

- Initial Price vs Final Price
- Rating vs Popularity Metric
- Discount vs Ratings

Visualizations Used:

- Scatter plots
- Correlation analysis

### Category-Level Analysis

Compared categories based on:

- Average ratings
- Average discounts
- Popularity metric
- Product counts

Visualizations Used:

- Bar charts
- Category comparison plots

---

## Key Insights

### Product Ratings and Customer Satisfaction

- Most products received ratings between 4.0 and 4.5 stars.
- Customer satisfaction appears consistently high across the platform.
- Products with zero ratings are likely new listings or products with low customer engagement.

### Pricing and Discount Patterns

- Most products are sold close to their listed price.
- Premium-priced products show significantly larger discounts.
- Customer ratings remain high regardless of price range.

### Category Performance

Top-performing categories based on popularity metric:

- Tunics
- Perfume and Body Mist
- Co-ords

Stable performing categories:

- Backpacks
- Lipsticks
- Boots

---

## Business Recommendations

### Marketing Optimization

Promote high-performing niche categories such as:

- Tunics
- Perfume and Body Mist

through homepage placements and targeted advertisements.

### Review Generation Strategy

Encourage customers to review newly launched products through:

- Reward points
- Discounts
- Follow-up email campaigns

### Premium Product Promotions

Focus flash-sale campaigns on premium products because they demonstrate higher discount elasticity and stronger response to promotional pricing.
