-- 1667. Fix Names in a Table
-- https://leetcode.com/problems/fix-names-in-a-table/

-- Schema:
Create table If Not Exists Users (
    user_id int,
    name varchar(40)
);

-- Rows:
Truncate table Users;
insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');

-- Ans:
SELECT
    user_id,
    CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2, 1))) AS name
FROM Users;
