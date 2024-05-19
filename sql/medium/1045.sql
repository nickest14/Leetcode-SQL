-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/

-- Schema:
Create table If Not Exists Customer (
    customer_id int,
    product_key int
);

Create table Product (
    product_key int
);

-- Rows:
Truncate table Customer;
insert into Customer (customer_id, product_key) values ('1', '5');
insert into Customer (customer_id, product_key) values ('2', '6');
insert into Customer (customer_id, product_key) values ('3', '5');
insert into Customer (customer_id, product_key) values ('3', '6');
insert into Customer (customer_id, product_key) values ('1', '6');
Truncate table Product;
insert into Product (product_key) values ('5');
insert into Product (product_key) values ('6');

-- Ans:
WITH cte AS (
    SELECT customer_id FROM customer
    GROUP BY customer_id
    HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM PRODUCT)
)
SELECT customer_id FROM cte;