CREATE DATABASE IF NOT EXISTS
olist_portfolio;
USE olist_portfolio;

USE olist_portfolio;
SELECT
     COUNT(*) AS total_orders,
     COUNT(DISTINCT order_id) AS
unique_orders,
    COUNT(DISTINCT customer_id) AS
unique_customers
FROM `orders (1)`;

USE olist_portfolio;

SELECT COUNT(*) AS total_orders
FROM `orders(1)`;

SELECT COUNT(*) AS total_products
FROM `products(1)`;

SELECT COUNT(*) AS total_customers
FROM `customers(1)`;

USE olist_portfolio;
SHOW TABLES;

USE olist_portfolio;

SELECT COUNT(*) AS total_orders
FROM `orders (1)`;

SELECT COUNT(*) AS total_products
FROM `products (1)`;

SELECT COUNT(*) AS total_customers
FROM `customers (1)`;

USE olist_portfolio;
SELECT * 
FROM `orders (1)`
LIMIT 5;

SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity
FROM `orders (1)`
GROUP BY payment_method
ORDER BY total_orders DESC; 

SELECT
    product_id,
    SUM(quantity) AS total_quantity,
    COUNT(*) AS total_orders
FROM `orders (1)`
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 10;

SELECT * 
FROM `products (1)`
LIMIT 10;

SELECT
    o.product_id,
    p.product_name,
    p.category,
    p.price,
    SUM(o.quantity) AS total_quantity,
    COUNT(*) AS total_orders
FROM `orders (1)` o
JOIN `products (1)` p
    ON o.product_id = p.product_id
GROUP BY
    o.product_id,
    p.product_name,
    p.category,
    p.price
ORDER BY total_quantity DESC
LIMIT 10;

USE olist_portfolio;

SELECT
    p.category,
    SUM(o.quantity) AS total_quantity,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM `orders (1)` o
JOIN `products (1)` p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(o.quantity * p.price), 2) AS monthly_revenue
FROM `orders (1)` o
JOIN `products (1)` p
    ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity
FROM `orders (1)`
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;