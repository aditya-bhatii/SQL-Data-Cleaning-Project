SQL Data Cleaning Queries (Organized)

1. Raw Data Check

Query:

SELECT *
FROM raw_sales;

Purpose:
Used to inspect and understand the raw dataset before performing any cleaning operations.

--------------------------------------------------

2. Duplicate Records Check

Query:

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

Purpose:
Used to identify duplicate records present in the dataset.

--------------------------------------------------

3. Create Clean Table

Query:

CREATE TABLE clear_sales AS
SELECT DISTINCT *
FROM raw_sales;

Purpose:
Creates a new table containing only unique records by removing duplicates.

--------------------------------------------------

4. Raw Table Count

Query:

SELECT COUNT(*)
FROM raw_sales;

Purpose:
Returns the total number of rows in the raw dataset.

--------------------------------------------------

5. Clean Table Count

Query:

SELECT COUNT(*)
FROM clear_sales;

Purpose:
Returns the total number of rows after duplicate removal for comparison and validation.

--------------------------------------------------

6. Extra Spaces Check

Query:

SELECT CustomerName
FROM clear_sales
WHERE CustomerName <> TRIM(CustomerName);

Purpose:
Identifies records containing leading or trailing spaces.

--------------------------------------------------

7. Customer Name Trim

Query:

UPDATE clear_sales
SET CustomerName = TRIM(CustomerName);

Purpose:
Removes unnecessary leading and trailing spaces from customer names.

--------------------------------------------------

8. City Trim

Query:

UPDATE clear_sales
SET City = TRIM(City);

Purpose:
Removes unnecessary leading and trailing spaces from city names.

--------------------------------------------------

9. Product Trim

Query:

UPDATE clear_sales
SET Product = TRIM(Product);

Purpose:
Removes unnecessary leading and trailing spaces from product names.

--------------------------------------------------

10. Category Trim

Query:

UPDATE clear_sales
SET Category = TRIM(Category);

Purpose:
Removes unnecessary leading and trailing spaces from category names.

--------------------------------------------------

11. Product Format Standardization

Query:

UPDATE clear_sales
SET Product = INITCAP(Product);

Purpose:
Standardizes product names by converting them to title case.

--------------------------------------------------

12. Customer Name Format Standardization

Query:

UPDATE clear_sales
SET CustomerName = INITCAP(CustomerName);

Purpose:
Standardizes customer names by converting them to title case.

--------------------------------------------------

13. City Format Standardization

Query:

UPDATE clear_sales
SET City = INITCAP(City);

Purpose:
Standardizes city names by converting them to title case.

--------------------------------------------------

14. Category Format Standardization

Query:

UPDATE clear_sales
SET Category = INITCAP(Category);

Purpose:
Standardizes category names by converting them to title case.

--------------------------------------------------

15. NULL Customer Check

Query:

SELECT *
FROM clear_sales
WHERE CustomerName IS NULL;

Purpose:
Identifies records with missing customer names.

--------------------------------------------------

16. NULL Customer Replacement

Query:

UPDATE clear_sales
SET CustomerName = 'Unknown'
WHERE CustomerName IS NULL;

Purpose:
Replaces missing customer names with a default value.

--------------------------------------------------

17. NULL Quantity Check

Query:

SELECT *
FROM clear_sales
WHERE Quantity IS NULL;

Purpose:
Identifies records with missing quantity values.

--------------------------------------------------

18. NULL Quantity Removal

Query:

DELETE FROM clear_sales
WHERE Quantity IS NULL;

Purpose:
Removes records where quantity information is missing.

--------------------------------------------------

19. NULL Order Date Check

Query:

SELECT *
FROM clear_sales
WHERE OrderDate IS NULL;

Purpose:
Identifies records with missing order dates.

--------------------------------------------------

20. Quantity Inspection

Query:

SELECT Quantity
FROM clear_sales
LIMIT 10;

Purpose:
Used to review sample quantity values before validation.

--------------------------------------------------

21. Invalid Quantity Check

Query:

SELECT *
FROM clear_sales
WHERE Quantity::NUMERIC <= 0;

Purpose:
Identifies records containing zero or negative quantity values.

--------------------------------------------------

22. Invalid Quantity Removal

Query:

DELETE FROM clear_sales
WHERE Quantity::NUMERIC <= 0;

Purpose:
Removes records containing invalid quantity values.

--------------------------------------------------

23. Final Verification

Query:

SELECT *
FROM clear_sales;

Purpose:
Displays the final cleaned dataset for validation and review.
