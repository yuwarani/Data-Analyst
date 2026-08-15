# 📊 E-Commerce Sales Analytics

Welcome to my **E-Commerce Sales Analytics Project**.

This project analyzes e-commerce sales data using **Excel, Power Query, SQL, and Power BI**. It covers the complete data analytics process, including **data cleaning, data transformation, database design, SQL analysis, data modelling, DAX, and dashboard development**.

## 🛠️ Tools & Skills

* Microsoft Excel
* Power Query
* SQL
* Power BI
* DAX
* Data Cleaning
* Data Transformation
* Data Modelling
* SQL Joins
* KPI Analysis
* Data Visualization
* Dashboard Development
* Business Intelligence

## 📁 Project Overview

The project uses an e-commerce dataset containing **5,000 sales records** with information about customers, products, orders, sales, costs, profits, discounts, payment methods, sales channels, and order status.

The data was cleaned and transformed before being analyzed in SQL and visualized using Power BI.

## 🧹 Excel & Power Query – Data Cleaning

The raw dataset was cleaned and prepared using **Excel and Power Query**.

### Key Cleaning Steps

* Removed duplicate Order IDs
* Removed unnecessary spaces using Trim and Clean
* Standardized text and category values
* Handled missing values
* Corrected column data types
* Validated Quantity, Unit Price, and Discount values
* Recalculated Sales for validation
* Recalculated Profit for validation
* Checked Sales and Profit differences
* Prepared the final cleaned dataset for SQL analysis

## 🗄️ SQL – Data Analysis

The cleaned dataset was imported into SQL and organized into three tables:

* **Customers**
* **Products**
* **Orders**

Relationships were created using **Customer_ID** and **Product_ID**.

### SQL Analysis

* Total Sales
* Total Profit
* Total Orders
* Top Customers
* Top Products
* Sales by Country
* Sales by Category
* Country and Category Performance
* Monthly Sales Trends
* Sales Channel Performance
* Return Rate by Category

### SQL Skills Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* HAVING
* Aggregate Functions
* INNER JOIN
* CASE Statements
* CTEs
* Window Functions
* Primary Keys
* Foreign Keys

## 📊 Power BI – E-Commerce Sales Performance Dashboard

An interactive **Power BI dashboard** was developed to present the key findings and business performance.

### 📈 Key KPIs

* Total Sales
* Total Profit
* Total Orders
* Total Customers
* Average Order Value (AOV)
* Profit Margin %

### 📊 Dashboard Analysis

* Monthly Sales Trend
* Sales by Category
* Top 10 Products
* Sales by Country
* Order Status Analysis
* Customer Performance
* Product Performance
* Regional Performance
* Sales Channel Performance

### Power BI Skills Used

* Power Query
* Data Modelling
* Table Relationships
* DAX Measures
* KPI Cards
* Slicers & Filters
* Charts & Maps
* Interactive Dashboard Development
* Data Visualization

## 🔗 Data Model

The Power BI and SQL data model uses three main tables:

**Customers → Orders ← Products**

* `Customer_ID` connects **Customers** and **Orders**
* `Product_ID` connects **Products** and **Orders**
* Customers and Products have **one-to-many relationships** with Orders

## 📁 Project Structure

```text
E-Commerce-Sales-Analytics/
│
├── data/
│   └── ecommerce-data.xlsx
│
├── sql/
│   └── ecommerce-analysis.sql
│
├── powerbi/
│   └── E-Commerce-Sales-Dashboard.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

### 📂 File Description

* **`data/`** – Contains the raw and cleaned e-commerce dataset.
* **`sql/`** – Contains SQL queries used for database creation and analysis.
* **`powerbi/`** – Contains the Power BI dashboard file.
* **`images/`** – Contains dashboard screenshots.
* **`README.md`** – Contains the complete project overview and documentation.

## 🔄 Project Workflow

**Raw Data → Excel → Power Query → Data Cleaning → SQL → Data Analysis → Power BI → Dashboard → Business Insights**

## 🎯 Purpose

The purpose of this project is to showcase my **Excel, Power Query, SQL, Power BI, data cleaning, data modelling, data analysis, and visualization skills** through an end-to-end e-commerce sales analysis.

## 📫 Contact

Feel free to connect with me to discuss **Data Analytics, Excel, SQL, Power BI, Business Intelligence, and related opportunities**.

---

⭐ **Thank you for visiting my E-Commerce Sales Analytics Project!**
