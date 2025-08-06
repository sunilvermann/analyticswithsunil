-- Assigning the role for the account 
USE ROLE ACCOUNTADMIN;


-- Assigning the warehouse to the account 
USE WAREHOUSE COMPUTE_WH;

-- Creating a database named as SALES_DATABASE
CREATE DATABASE IF NOT EXISTS SQL_CLASS_12;

-- CREATING a schema for the SALES_DATABASE 
CREATE SCHEMA IF NOT EXISTS SQL_CLASS_12_SCHEMA;

-- USING THE DATABASE CREATED SALES_DATABASE 
USE DATABASE SQL_CLASS_12;

-- USING THE SCHEMA CREATED SALES_SCHEMA
USE SCHEMA SQL_CLASS_12_SCHEMA;

-- CREATING A TABLE FOR THE SESSION
CREATE TABLE SALES_TRANSACTIONS (
    TRANSACTION_ID INT PRIMARY KEY,
    CATEGORY VARCHAR(50),
    SUBCATEGORY VARCHAR(50),
    TRANSACTION_DATE DATE,
    DELIVERY_DATE DATE,
    QUANTITY INT,
    UNIT_PRICE DECIMAL(10, 2),
    TOTAL_SALE DECIMAL(15, 2)
);


-- INSERTING VALUES INTO THE SALES_TRANSACTION TABLE 
INSERT INTO SALES_TRANSACTIONS (TRANSACTION_ID, CATEGORY, SUBCATEGORY, TRANSACTION_DATE, DELIVERY_DATE, QUANTITY, UNIT_PRICE, TOTAL_SALE)
VALUES
(1, 'Electronics', 'Mobile', '2025-01-01', '2025-01-05', 2, 400.00, 800.00),
(2, 'Electronics', 'Laptop', '2025-01-03', '2025-01-10', 1, 1200.00, 1200.00),
(3, 'Home Appliances', 'Refrigerator', '2025-01-05', '2025-01-12', 1, 1500.00, 1500.00),
(4, 'Home Appliances', 'Washing Machine', '2025-01-07', '2025-01-15', 1, 800.00, 800.00),
(5, 'Furniture', 'Sofa', '2025-01-09', '2025-01-18', 1, 2000.00, 2000.00),
(6, 'Furniture', 'Dining Table', '2025-01-11', '2025-01-20', 1, 1500.00, 1500.00),
(7, 'Electronics', 'Mobile', '2025-01-13', '2025-01-20', 3, 350.00, 1050.00),
(8, 'Home Appliances', 'Microwave', '2025-01-15', '2025-01-22', 2, 250.00, 500.00),
(9, 'Furniture', 'Chair', '2025-01-17', '2025-01-24', 4, 150.00, 600.00),
(10, 'Electronics', 'Tablet', '2025-01-19', '2025-01-27', 2, 300.00, 600.00),
(11, 'Electronics', 'Headphones', '2025-01-21', '2025-01-28', 5, 100.00, 500.00),
(12, 'Electronics', 'Smartwatch', '2025-01-22', '2025-01-29', 2, 150.00, 300.00),
(13, 'Home Appliances', 'Air Conditioner', '2025-01-23', '2025-01-30', 1, 1200.00, 1200.00),
(14, 'Home Appliances', 'Vacuum Cleaner', '2025-01-24', '2025-01-31', 2, 300.00, 600.00),
(15, 'Furniture', 'Bookshelf', '2025-01-25', '2025-02-01', 1, 700.00, 700.00),
(16, 'Furniture', 'Bed', '2025-01-26', '2025-02-03', 1, 2500.00, 2500.00),
(17, 'Electronics', 'Mobile', '2025-01-27', '2025-02-04', 4, 380.00, 1520.00),
(18, 'Home Appliances', 'Refrigerator', '2025-01-28', '2025-02-05', 1, 1400.00, 1400.00),
(19, 'Furniture', 'Wardrobe', '2025-01-29', '2025-02-06', 1, 1800.00, 1800.00),
(20, 'Electronics', 'Smart TV', '2025-01-30', '2025-02-07', 1, 900.00, 900.00),
(21, 'Electronics', 'Mobile', '2025-01-31', '2025-02-08', 3, 400.00, 1200.00),
(22, 'Furniture', 'Couch', '2025-02-01', '2025-02-09', 2, 2200.00, 4400.00),
(23, 'Home Appliances', 'Washing Machine', '2025-02-02', '2025-02-10', 1, 850.00, 850.00),
(24, 'Home Appliances', 'Dishwasher', '2025-02-03', '2025-02-11', 1, 950.00, 950.00),
(25, 'Electronics', 'Camera', '2025-02-04', '2025-02-12', 1, 650.00, 650.00);



SELECT * FROM SALES_TRANSACTIONS;

-- QUERY-1
/*
     You are given the sales data of our company. Your job is analysis is to analyse the data and return us the analysis.
     The first requirement is to, write a sql query to return us all the data that is just related to 'Furniture' and 'Appliances'
     After returning that particular data we need to see the data where the transaction date is after '2025-01-15'.
     Return the result in desc oredr of total sales amount and categories.
     Note that we need all the columns in the result.
*/ 
SELECT  *    
FROM SALES_TRANSACTIONS
WHERE CATEGORY IN ('Furniture', 'Home Appliances') AND TRANSACTION_DATE > '2025-01-15'
ORDER  BY TOTAL_SALE DESC, CATEGORY DESC;


-- STARTING WITH THE AGGREGATE FUNCTIONS
SELECT * FROM SALES_TRANSACTIONS;

SELECT 
      SUM(QUANTITY) AS TOTAL_QUANTITY_SOLD_TILL_DATE  -- SUM IS COULUMN WISE OPEARTION 
FROM SALES_TRANSACTIONS;

SELECT 
      QUANTITY + UNIT_PRICE AS TOTAL_QUANTITY_AND_UNIT -- ROW WISE OPEARTION
FROM SALES_TRANSACTIONS;

-- COUNT()
SELECT COUNT(CATEGORY) AS TOTAL_RECORDS
FROM SALES_TRANSACTIONS
WHERE CATEGORY = 'Furniture';

-- MIN() - returning 1 value. it is not cleaning. it is comparing the whole column
SELECT 
      MIN(QUANTITY) AS MIN_QUANTITY_SOLD
FROM SALES_TRANSACTIONS;

-- MAX() - 
SELECT 
      MAX(QUANTITY) AS MAXIMUM_QTY_SOLD
FROM SALES_TRANSACTIONS;

-- AVG() - FIND THE MEAN=(AVG)
SELECT
      ROUND(AVG(TOTAL_SALE), 2) AS AVG_TOTAL_SALE_VALUE
FROM SALES_TRANSACTIONS;     
-- OR
SELECT
     ROUND(SUM(TOTAL_SALE) / COUNT(TRANSACTION_ID), 2) AS AVG_TOTAL_SALE_VALUE
FROM SALES_TRANSACTIONS;

-- GROUP BY
SELECT * FROM SALES_TRANSACTIONS;

SELECT CATEGORY,
      SUM(QUANTITY) AS TOTAL_QTY_SOLD
FROM SALES_TRANSACTIONS
GROUP BY CATEGORY;

-- UPDATING OUR TEMPLATE
/*
SELECT -- SELECTING THE COLUMNS / DATA TO DISPLAY
FROM   -- SELECTING THE SOURCE OF DATA
WHERE  -- FILTER OUR DATA
GROUP BY -- AGGREGATE OUR DATA ACROSS GROUPS
HAVING  -- CONDITION OUR GROUP BY AGGREGATIONS
ORDER BY -- SORT OUR DATA 
*/

-- EXAMPLE
SELECT
    CATEGORY,
    SUM(TOTAL_SALE)
FROM SALES_TRANSACTIONS
GROUP BY CATEGORY;

-- ADVANCING THE AGGREGATE FUNCTION
-- QUERY-1
/*
  You are given the sales data of our company. we have business across multiple categories. we want to see the sum of total sale value across category. Give us the category which has higest sale at the top and then at the least one at the bottom.
*/ SELECT * FROM SALES_TRANSACTIONS;
SELECT
    CATEGORY,
    SUM(TOTAL_SALE) AS TOTAL_SALE_VALUE      
FROM SALES_TRANSACTIONS
GROUP BY CATEGORY
ORDER BY SUM(TOTAL_SALE) DESC;

-- QUERY-2
/* 
   Find the total quantity of products sold in each subcategory where the total sale amount is greater than $500.
   You need to return thr result in the order of ascending of quantity sold.
*/
SELECT * FROM SALES_TRANSACTIONS;

SELECT
    SUBCATEGORY,
    SUM(QUANTITY) AS TOTAL_QTY_VALUE
FROM SALES_TRANSACTIONS
WHERE TOTAL_SALE > 500
GROUP BY SUBCATEGORY
ORDER BY  SUM(QUANTITY) ASC;

-- QUERY - 3
/*
   Find the average sale price for each category, and display the results in descending order of the average sale price.
 */ SELECT * FROM SALES_TRANSACTIONS;
SELECT
      CATEGORY,
      AVG(TOTAL_SALE) AS AVG_TOTAL_SALE
FROM SALES_TRANSACTIONS
GROUP BY CATEGORY
ORDER BY AVG(TOTAL_SALE) DESC;

-- QUERY-4
/*
  Write a SQL query to retrieve the aggregations of the sum, count, avg of total sale 
  across each categories and sub-categories as well.
*/ SELECT * FROM SALES_TRANSACTIONS;
SELECT
    CATEGORY,
    SUBCATEGORY,
    SUM(TOTAL_SALE) AS SUM_TOTAL_SALE,    
    ROUND(AVG(TOTAL_SALE), 2) AS AVG_TOTAL_SALE,
    COUNT(TOTAL_SALE) AS COUNT_TOTAL_SALE
FROM SALES_TRANSACTIONS
GROUP BY CATEGORY, SUBCATEGORY;

-- QUERY-5
/*
  From the SALE_TRANSACTIONS table. find the top 3 sub-categories under each main category where the total quantity sold is greater than 3. Dispaly the following details.
  CATEGORY
  SUBCATEGORY
  Total Quantity sold (as Total_Quantity)
  Total Sales Value (as TOTAL_SALE_AMOUNT)
  Only consider transactions where the UNIT_price is graeter than 300. Sort the results by CATEGORY (ascending), 
  TOTAL_SALE_AMOUNT (descending).
  Your output must only contain top 3 records per category based on TOTAL_SALE_AMOUNT.  
*/ SELECT * FROM SALES_TRANSACTIONS;

SELECT
    CATEGORY,
    SUBCATEGORY,
    SUM(QUANTITY) AS TOTAL_QTY_SALE,
    SUM(TOTAL_SALE) AS TOTAL_SALE_AMOUNT
FROM SALES_TRANSACTIONS
WHERE UNIT_PRICE > 300
GROUP BY CATEGORY, SUBCATEGORY
HAVING SUM(QUANTITY) > 3
ORDER BY CATEGORY ASC, SUM(TOTAL_SALE) DESC
LIMIT 3;
