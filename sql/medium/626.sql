-- 626. Exchange Seats
-- https://leetcode.com/problems/exchange-seats/

-- Schema:
Create table If Not Exists Seat (
    id int,
    student varchar(255)
);

-- Rows:
Truncate table Seat;
insert into Seat (id, student) values ('1', 'Abbot');
insert into Seat (id, student) values ('2', 'Doris');
insert into Seat (id, student) values ('3', 'Emerson');
insert into Seat (id, student) values ('4', 'Green');
insert into Seat (id, student) values ('5', 'Jeames');

-- Ans:
WITH swapped AS (
    SELECT
        CASE
            WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM seat) THEN id + 1
            WHEN id % 2 = 0 THEN id - 1
            ELSE id
        END AS new_id,
        student
    FROM seat
)
SELECT new_id AS id, student
FROM Swapped
ORDER BY id;

-- Another solution:
SELECT id,
CASE
    WHEN id % 2 = 1 AND LEAD(student, 1) OVER(ORDER BY id) IS NULL THEN student
    WHEN id % 2 = 0 then LAG(student, 1) OVER (ORDER BY id)
    ELSE LEAD(student, 1) OVER (ORDER BY id)
    END AS student
FROM Seat;