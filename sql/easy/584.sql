-- 584. Find Customer Referee
-- https://leetcode.com/problems/find-customer-referee/

-- Schema:
Create table If Not Exists Customer (
    id int,
    name varchar(25),
    referee_id int
);

-- Rows:
Truncate table Customer;
insert into Customer (id, name, referee_id) values ('1', 'Will', null);
insert into Customer (id, name, referee_id) values ('2', 'Jane', null);
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer (id, name, referee_id) values ('4', 'Bill', null);
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

-- Ans:
SELECT name FROM customer WHERE referee_id is null OR referee_id != 2;
