CREATE DATABASE Sales_Analysis

USE Sales_Analysis

SELECT * FROM customers
SELECT * FROM products
SELECT * FROM orders

--Analyze sales Trends Over time
---Get Total Sales for each month in 2023

SELECT DATENAME(MONTH, order_date) as Month_name,MONTH(order_date) AS Month,SUM(total_amount)
FROM orders
WHERE year(order_date) = 2023
GROUP BY DATENAME(MONTH, order_date),MONTH(order_date)
ORDER BY Month 

--2. Identify Top - Selling Products

--Top 5 Selling Products

SELECT TOP 5 p.product_id,p.product_name,SUM(quantity) as Number_of_items
FROM products p
JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.product_id,p.product_name
ORDER BY Number_of_items desc


--3.Segment Customers Based on Purchase Behavior:

-- Segment customers based on the total amount they spent

--If Total_Amount >100 = Highvalue , If >50 = Medium value

-- Segment customers based on the total amount they spent

SELECT customer_name,CASE WHEN total_amount >=100 THEN 'High value'
WHEN total_amount >=50 THEN 'Medium value'
ELSE 'Low value' END AS 'customer_segment',total_amount
FROM customers c
LEFT JOIN ( SELECT customer_id,SUM(total_amount) as total_amount
FROM orders
GROUP BY customer_id) o
ON c.customer_id = o.customer_id
ORDER BY total_amount desc







