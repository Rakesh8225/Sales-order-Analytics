SELECT *
FROM `sales_analytics`.`customers`
LIMIT 1;

SHOW CREATE TABLE `sales_analytics`.`customers`;

CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(1, 'Mohit', 'mohit@gmail.com', 'Bhubaneswar'),
(2, 'Guru', 'guru@gmail.com', 'Sambalpur'),
(3, 'SP Sidharth', 'spsidharth@gmail.com', 'Rourkela'),
(4, 'Rakesh', 'rakesh@gmail.com', 'Cuttack'),
(5, 'Dora', 'dora@gmail.com', 'Puri');

INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Smartphone', 'Electronics', 25000),
(3, 'Headphones', 'Electronics', 2500),
(4, 'Office Chair', 'Furniture', 7500);

INSERT INTO orders (order_id, customer_id, order_date, product_id, quantity)
VALUES
(1, 1, 20261001, 1, 2),
(2, 2, 20261002, 2, 1),
(3, 3, 20261003, 3, 3),
(4, 4, 20261004, 4, 1),
(5, 5, 20261004, 1, 1);

INSERT INTO order_items
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 1, 1);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT
    c.customer_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 1;

SELECT
    c.customer_name,
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.quantity * p.price AS order_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * p.price) AS total_sales,
    AVG(oi.quantity * p.price) AS average_order_value,
    MIN(oi.quantity * p.price) AS minimum_order_value,
    MAX(oi.quantity * p.price) AS maximum_order_value
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

SELECT
    p.category,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * p.price) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT
    o.order_date,
    SUM(oi.quantity * p.price) AS daily_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;
