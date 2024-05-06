-- 620. Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/

-- Schema:
Create table If Not Exists cinema (
    id int, movie varchar(255),
    description varchar(255),
    rating float
);

-- Rows:
Truncate table cinema;
insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

-- Ans:
SELECT * FROM cinema WHERE MOD(id, 2) = 1 AND description != 'boring' ORDER BY rating DESC;
