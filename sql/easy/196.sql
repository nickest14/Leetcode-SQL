-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/

-- Schema:
Create table If Not Exists Person (
    Id int,
    Email varchar(255)
);

-- Rows:
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

-- Ans:
WITH ranked_person AS (
    SELECT *, dense_rank() OVER (PARTITION BY email ORDER BY id) AS rank
    FROM Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id FROM ranked_person WHERE rank > 1
);