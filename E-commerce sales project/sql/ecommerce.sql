########################################################################################################
#                     E-commerce sale performance analysis
#########################################################################################################

create database ecommerce_sales;
-- --------------------------------------------------------------------------------------------------------
use ecommerce_sales;
-- --------------------------------------------------------------------------------------------------------
CREATE TABLE temp (
    Order_ID          VARCHAR(20) PRIMARY KEY,
    Order_Date        DATE NOT NULL,
    Customer_ID       VARCHAR(20),
    Customer_Name     VARCHAR(100),
    Email             VARCHAR(150),
    Country           VARCHAR(50),
    Region            VARCHAR(80),
    Product_ID        VARCHAR(20),
    Product_Name      VARCHAR(120),
    Category          VARCHAR(80),
    Sub_Category      VARCHAR(80),
    Quantity          INT,
    Unit_Price        DECIMAL(10,2),
    Discount_Pct      DECIMAL(5,2),
    Sales             DECIMAL(12,2),
    Cost              DECIMAL(12,2),
    Profit            DECIMAL(12,2),
    Payment_Method    VARCHAR(50),
    Device            VARCHAR(30),
    Sales_Channel     VARCHAR(50),
    Order_Status      VARCHAR(30),
    Rating            INT
);

select * from temp;
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE customers (
    Customer_ID      VARCHAR(20) PRIMARY KEY,
    Customer_Name    VARCHAR(100),
    Email            VARCHAR(150),
    Country          VARCHAR(50),
    Region           VARCHAR(80)
);

INSERT INTO customers (
    Customer_ID,
    Customer_Name,
    Email,
    Country,
    Region
)
SELECT DISTINCT
    Customer_ID,
    Customer_Name,
    Email,
    Country,
    Region
FROM temp;
-- ---------------------------------------------------------------------------------------------------------------
SELECT *
FROM temp
WHERE Customer_ID = 'C01147';

SELECT Customer_ID, COUNT(*)
FROM temp
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
-- ----------------------------------------------------------------------------------------------------------------
INSERT INTO customers (
    Customer_ID,
    Customer_Name,
    Email,
    Country,
    Region
)
SELECT
    Customer_ID,
    MAX(Customer_Name),
    MAX(Email),
    MAX(Country),
    MAX(Region)
FROM temp t
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.Customer_ID = t.Customer_ID
)
GROUP BY Customer_ID;

select * from Customers;

-- -------------------------------------------------------------------------------------------------------
CREATE TABLE products (
    Product_ID       VARCHAR(20) PRIMARY KEY,
    Product_Name     VARCHAR(120),
    Category         VARCHAR(80),
    Sub_Category     VARCHAR(80)
);


INSERT INTO products (
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
)
SELECT DISTINCT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
FROM temp;


select * from products;
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE orders (
    Order_ID          VARCHAR(20) PRIMARY KEY,
    Order_Date        DATE NOT NULL,
    Customer_ID       VARCHAR(20),
    Product_ID        VARCHAR(20),
    Quantity          INT,
    Unit_Price        DECIMAL(10,2),
    Discount_Pct      DECIMAL(5,2),
    Sales             DECIMAL(12,2),
    Cost              DECIMAL(12,2),
    Profit            DECIMAL(12,2),
    Payment_Method    VARCHAR(50),
    Device            VARCHAR(30),
    Sales_Channel     VARCHAR(50),
    Order_Status      VARCHAR(30),
    Rating            INT,

    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);

INSERT INTO orders (
    Order_ID,
    Order_Date,
    Customer_ID,
    Product_ID,
    Quantity,
    Unit_Price,
    Discount_Pct,
    Sales,
    Cost,
    Profit,
    Payment_Method,
    Device,
    Sales_Channel,
    Order_Status,
    Rating
)
SELECT
    Order_ID,
    Order_Date,
    Customer_ID,
    Product_ID,
    Quantity,
    Unit_Price,
    Discount_Pct,
    Sales,
    Cost,
    Profit,
    Payment_Method,
    Device,
    Sales_Channel,
    Order_Status,
    Rating
FROM temp;

select * from orders;

-- ------------------------------------------------------------------------------------------------------
-- 1. Total sales, profit and orders
-- ------------------------------------------------------------------------------------------------------
select  count(distinct(order_ID)) as total_orders,
	    round(sum(sales),2) as total_sales,
	    round(sum(profit),2) as total_profit,
        round(100*(sum(profit)/sum(sales)),2) as profit_margin_pct
		from orders;
        
-- --------------------------------------------------------------------------------------------------------
-- 2.sales by category
-- --------------------------------------------------------------------------------------------------------
select p.category,
		count(o.order_id) as total_orders,
        round(sum(o.sales),2) as total_sales, 
        round(sum(o.profit),2) as total_profit
from products p
join orders o 
		on p.product_id = o.product_id
group by p.category
order by total_sales desc;
-- ---------------------------------------------------------------------------------------------------------
-- 3.sales by country
-- ---------------------------------------------------------------------------------------------------------
SELECT
    c.Country,
    COUNT(o.Order_ID) AS Total_Orders,
    ROUND(SUM(o.Sales), 2) AS Total_Sales,
    ROUND(SUM(o.Profit), 2) AS Total_Profit
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Country
ORDER BY Total_Sales DESC;
-- ---------------------------------------------------------------------------------------------------------
-- 4.join all tables
-- ---------------------------------------------------------------------------------------------------------
 SELECT
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Country,
    p.Product_Name,
    p.Category,
    o.Quantity,
    o.Unit_Price,
    o.Sales,
    o.Profit,
    o.Order_Status
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
JOIN products p
    ON o.Product_ID = p.Product_ID;
    
-- --------------------------------------------------------------------------------------------------------
-- 5.Top 10 Customers 
-- ---------------------------------------------------------------------------------------------------------
select c.customer_id,
	   c.customer_name,
       count(o.order_id) as total_orders,
       round(sum(o.sales),2) as total_sales,
       round(sum(o.profit),2) as total_profit,
       round(100*(sum(profit)/sum(sales)),2) as profit_margin_pct
       from customers c
       join orders o
	on c.customer_id = o.customer_id
    group by c.customer_name,c.customer_id
    order by total_sales ,total_profit desc
    limit 10;
       
-- -------------------------------------------------------------------------------------------
-- 6.Top 10 Products
-- -------------------------------------------------------------------------------------------
select p.product_id,
	   p.product_name,
       count(o.order_id) as total_orders,
       round(sum(o.quantity),2) as unit_sold,
       round(sum(o.sales),2) as total_sales,
       round(sum(o.profit),2) as total_profit,
       round(100*(sum(profit)/sum(sales)),2) as profit_margin_pct
       from products p
       join orders o
	on p.product_id = o.product_id
    group by p.product_name,p.product_id
    order by total_sales desc,total_profit desc,unit_sold desc
    limit 10;


-- --------------------------------------------------------------------------------------------------------
-- 7. Country + Category Analysis
-- ---------------------------------------------------------------------------------------------------------
select c.country,
	   c.customer_name,
       p.category,
       p.product_name,
       count(o.order_id) as total_orders,
       round(sum(o.quantity),2) as unit_sold,
       round(sum(o.sales),2) as total_sales,
       round(sum(o.profit),2) as total_profit,
       round(100*(sum(profit)/sum(sales)),2) as profit_margin_pct
       from products p
       join orders o
	on p.product_id = o.product_id
    join customers c
    on c.customer_id = o.customer_id
    group by p.category,c.country,p.product_name,c.customer_id
    order by total_sales desc,total_profit desc,unit_sold desc
    limit 10;
-- --------------------------------------------------------------------------------------------------------
-- 8. Monthly Sales Trend
-- ---------------------------------------------------------------------------------------------------------
select year(order_date) as year,
		month(order_date) as month,
       round(sum(sales),2) as total_sales,
       round(sum(profit),2) as total_profit,
       round(100*(sum(profit)/sum(sales)),2) as profit_margin_pct
       from orders
       group by year,month
       order by total_sales desc,total_profit desc,profit_margin_pct desc;
-- --------------------------------------------------------------------------------------------------------
  -- 9.sales channel performance
-- ---------------------------------------------------------------------------------------------------------
SELECT
    Sales_Channel,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Sales_Channel
ORDER BY Total_Sales DESC; 

-- --------------------------------------------------------------------------------------------------------
-- 10. Return Rate by Category
-- ---------------------------------------------------------------------------------------------------------
SELECT p.category,
       COUNT(o.order_id) AS total_orders,
       SUM(
           CASE
               WHEN o.order_status = 'Returned' THEN 1
               ELSE 0
           END
       ) AS orders_returned,
       ROUND(
           100.0 *
           SUM(
               CASE
                   WHEN o.order_status = 'Returned' THEN 1
                   ELSE 0
               END
           ) / COUNT(o.order_id),
           2
       ) AS return_rate
FROM orders o
JOIN products p
    ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY return_rate DESC;
-- ---------------------------------------------------------------------------------------------------------
        



