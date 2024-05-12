-- 1193. Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/

-- Schema:
Create table If Not Exists Transactions (
    id int,
    country varchar(4),
    state CHAR(8) CHECK (state IN ('approved', 'declined')),
    amount int,
    trans_date date
);

-- Rows:
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07');

-- Ans:
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(state) FILTER (WHERE state= 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(SUM(amount) FILTER(WHERE state = 'approved'), 0) AS approved_total_amount
FROM Transactions
GROUP BY month, country;