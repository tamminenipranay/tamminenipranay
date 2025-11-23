select * from retail_sales_dataset

SHOW COLUMNS FROM retail_sales_dataset;

SELECT `product category` FROM retail_sales_dataset LIMIT 10;



SELECT `Product Category`, SUM(`Total Amount`) AS revenue_by_category
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY revenue_by_category DESC;



SELECT DISTINCT `Product Category`
FROM retail_sales_dataset;



SELECT `Gender`, COUNT(*) AS num_customers
FROM retail_sales_dataset
GROUP BY `Gender`;


-- 1. Find Total Revenue and Total Sales
SELECT SUM(`Total Amount`) AS total_revenue,
       SUM(`Quantity`) AS total_units_sold
FROM retail_sales_dataset;


-- 2. Revenue and Units Sold by Gender
SELECT `Gender`,
       SUM(`Total Amount`) AS total_revenue,
       SUM(`Quantity`) AS total_units_sold
FROM retail_sales_dataset
GROUP BY `Gender`;


-- 3. Top Customers by Spending
SELECT `Customer ID`,
       SUM(`Total Amount`) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;


-- 4. Trends by Age Bracket
SELECT `Age`,
       SUM(`Total Amount`) AS revenue_per_age
FROM retail_sales_dataset
GROUP BY `Age`
ORDER BY revenue_per_age DESC
LIMIT 10;


-- 5. Monthly Sales Totals
SELECT DATE_FORMAT(`Date`, '%Y-%m') AS month,
       SUM(`Total Amount`) AS sales_total,
       SUM(`Quantity`) AS units_sold
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;


-- 6. Highest Spending Customer
SELECT `Customer ID`,
       SUM(`Total Amount`) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 1;



-- 7. Sales by Age Group
SELECT `Age`,
       SUM(`Total Amount`) AS sales_by_age,
       COUNT(*) AS transaction_count
FROM retail_sales_dataset
GROUP BY `Age`
ORDER BY sales_by_age DESC
LIMIT 10;


-- 8. Revenue by Product Category
SELECT `Product Category`,
       SUM(`Total Amount`) AS revenue_by_category,
       SUM(`Quantity`) AS units_sold
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY revenue_by_category DESC;


-- Find the overall total revenue and total number of units sold in the dataset.
SELECT SUM(`Total Amount`) AS total_revenue,
       SUM(`Quantity`) AS total_units_sold
FROM retail_sales_dataset;


-- Count the number of customers grouped by gender in the dataset.
SELECT `Gender`, COUNT(*) AS num_customers
FROM retail_sales_dataset
GROUP BY `Gender`;


-- List all the unique product categories available in the dataset.
SELECT DISTINCT `Product Category`
FROM retail_sales_dataset;


-- Show total sales for each month in your dataset.
SELECT DATE_FORMAT(`Date`, '%Y-%m') AS month, SUM(`Total Amount`) AS monthly_sales
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;


--  List the top 5 customers who spent the most.
SELECT `Customer ID`, SUM(`Total Amount`) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 5;


-- See which age groups contribute most to sales.
SELECT `Age`, SUM(`Total Amount`) AS total_sales
FROM retail_sales_dataset
GROUP BY `Age`
ORDER BY total_sales DESC;


--  Identify which product categories sell the most units.
SELECT `Product Category`, SUM(`Quantity`) AS units_sold
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY units_sold DESC;




-- 1. Sales Over Time Analysis

-- a) Monthly Sales Trends
SELECT DATE_FORMAT(`Date`, '%Y-%m') AS month, SUM(`Total Amount`) AS monthly_sales
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;


-- b) Daily Sales Trends
SELECT `Date`, SUM(`Total Amount`) AS daily_sales
FROM retail_sales_dataset
GROUP BY `Date`
ORDER BY `Date`;


-- 2. Customer Segmentation & Bestsellers

-- a) Top 5 Best-Selling Product Categories
SELECT `Product Category`, SUM(`Quantity`) AS total_units_sold
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_units_sold DESC
LIMIT 5;


-- b) Top 5 Customers by Total Spend
SELECT `Customer ID`, SUM(`Total Amount`) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 5;


-- c) Customer Segmentation by Age Group
SELECT CONCAT(FLOOR(`Age`/10)*10, 's') AS age_group, 
       COUNT(*) AS customers, SUM(`Total Amount`) AS revenue
FROM retail_sales_dataset
GROUP BY age_group
ORDER BY revenue DESC;
