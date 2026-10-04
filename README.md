
# Sales Order Analytics

A MySQL-based Sales and Order Analytics project for analyzing customers, products, orders, and sales performance using SQL.

##  Project Overview

This project demonstrates how SQL and relational database concepts can be used to manage sales and order data and generate useful business insights.

The database contains customer, product, order, and order-item information. SQL queries are used to calculate total sales, analyze product and customer performance, identify the highest-value customer, and generate daily and category-wise sales analysis.

##  Technologies Used

- MySQL
- SQL
- Relational Database Management
- JOINs
- Aggregate Functions
- GROUP BY
- ORDER BY
- Data Analysis

##  Database Structure

The project uses the following four tables:

### 1. Customers

Stores customer information.

| Column        | Description |

| customer_id   | Unique customer ID |
| customer_name | Customer name |
| email         | Customer email |
| city          | Customer city |

### 2. Products

Stores product information.

| Column       | Description |
| product_id   |  Unique product ID |
| product_name | Product name |
| category     | Product category |
| price        | Product price |

### 3. Orders

Stores order information.

| Column | Description |
|---|---|
| order_id    | Unique order ID |
| customer_id | Customer who placed the order |
| order_date  | Order date value |
| product_id  | Product ID |
| quantity    | Ordered quantity |

### 4. Order Items

Stores individual items associated with orders.

| Column | Description |
|---|---|
| order_item_id | Unique order-item ID |
| order_id      | Related order ID |
| product_id    | Related product ID |
| quantity      | Quantity purchased |

##  Relationships

The database uses primary and foreign keys to connect the tables.

```text
Customers
    │
    │ customer_id
    ▼
  Orders
    │
    │ order_id
    ▼
Order_Items
    │
    │ product_id
    ▼
 Products
```

## 📊 Analysis Performed

The project includes SQL queries for:

- Displaying customer, product, order, and order-item data
- Calculating total sales
- Product-wise sales analysis
- Product-wise quantity sold
- Customer-wise sales analysis
- Customer-wise quantity sold
- Identifying the highest-value customer
- Displaying order-level sales
- Calculating total number of orders
- Calculating average order value
- Finding minimum order value
- Finding maximum order value
- Category-wise sales analysis
- Category-wise quantity sold
- Daily sales analysis

## 🧮 SQL Concepts Demonstrated

This project demonstrates practical use of:

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `JOIN`
- `SUM()`
- `COUNT()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- Primary Keys
- Foreign Keys

## 🚀 How to Run

### Step 1: Install MySQL

Install MySQL and open a MySQL client such as MySQL Workbench.

### Step 2: Open the SQL File

Download:

`sales_order_analytics_actual.sql`

from this repository.

### Step 3: Execute the Database Setup

Run the database and table creation statements first:

```sql
CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;
```

Then execute the table creation and `INSERT` statements.

### Step 4: Run the Analysis Queries

After inserting the data, execute the analysis queries to generate sales and order insights.

> **Note:** The first two statements in the SQL file (`SELECT ... FROM sales_analytics.customers` and `SHOW CREATE TABLE ...`) are inspection queries and assume that the database/table already exists. They are not required for creating the database from scratch.

##  Project Files

```text
Sales-order-Analytics/
│
├── README.md
└── sales_order_analytics_actual.sql
```

##  Project Objective

The main objective of this project is to use MySQL and SQL queries to analyze sales and order data and extract meaningful information about customers, products, orders, categories, and daily sales.

##  Skills Demonstrated

- MySQL
- SQL Query Writing
- Database Design
- Relational Databases
- Data Analysis
- SQL JOINs
- Aggregate Functions
- Data Aggregation
- Business-Oriented Data Analysis

##  Future Improvements

Possible future improvements include:

- Adding more sales records
- Using a proper `DATE` data type for order dates
- Adding additional business metrics
- Creating SQL views for frequently used analysis
- Connecting the database to a visualization tool or dashboard

##  License

This project is created for educational and portfolio purposes.
