-- 596. Classes More Than 5 Students
-- https://leetcode.com/problems/classes-more-than-5-students/

-- Schema:
Create table If Not Exists Courses (
    student varchar(255),
    class varchar(255)
);

-- Rows:
Truncate table Courses;
insert into Courses (student, class) values ('A', 'Math');
insert into Courses (student, class) values ('B', 'English');
insert into Courses (student, class) values ('C', 'Math');
insert into Courses (student, class) values ('D', 'Biology');
insert into Courses (student, class) values ('E', 'Math');
insert into Courses (student, class) values ('F', 'Computer');
insert into Courses (student, class) values ('G', 'Math');
insert into Courses (student, class) values ('H', 'Math');
insert into Courses (student, class) values ('I', 'Math');

-- Ans:
SELECT class FROM Courses GROUP BY class HAVING COUNT(student) >= 5;
