-- 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/

-- Schema:
Create table If Not Exists Products (
    product_id int,
    new_price int,
    change_date date
);

-- Rows:
Truncate table Products;
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15');
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16');
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17');
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18');

-- Ans:
WITH product AS (
    SELECT DISTINCT(product_id) FROM Products
),
cte AS (
    SELECT product_id, new_price,
    dense_rank() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rank
    FROM Products WHERE change_date <= '2019-8-16'
)
SELECT p.product_id, COALESCE(cte.new_price, 10) AS price
FROM product AS p LEFT JOIN cte ON p.product_id = cte.product_id
WHERE rank = 1 OR rank IS NULL;
