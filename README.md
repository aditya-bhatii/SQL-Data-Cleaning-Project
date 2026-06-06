# SQL-Data-Cleaning-Project
Cleaning and transforming raw data using SQL queries
# SQL Data Cleaning Project

## Overview

In this project, I worked on a raw sales dataset and cleaned it using SQL in PostgreSQL.

The dataset contained several common data quality issues such as duplicate records, missing values, extra spaces, inconsistent text formatting, and invalid quantity values.

The goal of this project was to transform messy raw data into a clean dataset that can be used for analysis.

---

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL

---

## Dataset Columns

- OrderID
- OrderDate
- CustomerName
- City
- Product
- Category
- Quantity
- Price

---

## Data Cleaning Process

### 1. Checking for Duplicate Records

First, I identified duplicate rows in the dataset using GROUP BY and COUNT().

```sql
SELECT
    OrderID,
    OrderDate,
    CustomerName,
    City,
    Product,
    Category,
    Quantity,
    Price,
    COUNT(*)
FROM raw_sales
GROUP BY
    OrderID,
    OrderDate,
    CustomerName,
    City,
    Product,
    Category,
    Quantity,
    Price
HAVING COUNT(*) > 1;
```

After identifying duplicates, I created a clean table using DISTINCT.

```sql
CREATE TABLE clear_sales AS
SELECT DISTINCT *
FROM raw_sales;
```

---

### 2. Removing Extra Spaces

I found unwanted leading and trailing spaces in text columns and removed them using TRIM().

```sql
UPDATE clear_sales
SET CustomerName = TRIM(CustomerName);
```

The same process was applied to City, Product, and Category columns.

---

### 3. Standardizing Text Formatting

Some values had inconsistent formatting such as:

```
mobile phone
MOBILE PHONE
Mobile phone
```

To make the data consistent, I used INITCAP().

```sql
UPDATE clear_sales
SET Product = INITCAP(Product);
```

---

### 4. Handling Missing Values

I checked the dataset for NULL values.

```sql
SELECT *
FROM clear_sales
WHERE CustomerName IS NULL;
```

Missing customer names were replaced with "Unknown".

```sql
UPDATE clear_sales
SET CustomerName = 'Unknown'
WHERE CustomerName IS NULL;
```

---

### 5. Removing Invalid Quantity Values

I found records where Quantity was zero or negative.

```sql
SELECT *
FROM clear_sales
WHERE Quantity::NUMERIC <= 0;
```

Since these values were not valid sales transactions, they were removed.

```sql
DELETE FROM clear_sales
WHERE Quantity::NUMERIC <= 0;
```

---

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- HAVING
- COUNT()
- DISTINCT
- CREATE TABLE
- UPDATE
- DELETE
- TRIM()
- INITCAP()
- NULL Handling

---

## What I Learned

This project helped me understand how data cleaning is performed in real-world datasets.

Key learnings:

- Identifying and removing duplicate records
- Cleaning text data
- Handling missing values
- Validating data quality
- Preparing data for further analysis

---

## Project Structure

```
SQL-Data-Cleaning-Project/
│
├── raw_sales.csv
├── cleaned_sales.csv
├── cleaning_queries.sql
└── README.md
```

---

## Conclusion

Data cleaning is one of the most important steps in any data analysis workflow. Through this project, I practiced cleaning and validating raw data using SQL and gained hands-on experience with common data quality issues.

---

## Author

Aditya Bhati

Aspiring Data Analyst

Currently learning SQL, NumPy, Pandas, and working on real-world data analytics projects.
