-- 610. Triangle Judgement
-- https://leetcode.com/problems/triangle-judgement/description/

-- Schema:
Create table If Not Exists Triangle (
    x int,
    y int,
    z int
);

-- Rows:
Truncate table Triangle;
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');

-- Ans:
SELECT x, y, z,
CASE
    WHEN x + y <= z OR x + z <= y OR y + z <= x THEN 'No'
    ELSE 'Yes'
END AS triangle
FROM Triangle;