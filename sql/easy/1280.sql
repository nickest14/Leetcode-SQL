-- 1280. Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/

-- Schema:
Create table If Not Exists Students (
    student_id int, student_name varchar(20)
);

Create table If Not Exists Subjects (
    subject_name varchar(20)
);

Create table If Not Exists Examinations (
    student_id int,
    subject_name varchar(20)
);

-- Rows:
Truncate table Students;
insert into Students (student_id, student_name) values ('1', 'Alice');
insert into Students (student_id, student_name) values ('2', 'Bob');
insert into Students (student_id, student_name) values ('13', 'John');
insert into Students (student_id, student_name) values ('6', 'Alex');
Truncate table Subjects;
insert into Subjects (subject_name) values ('Math');
insert into Subjects (subject_name) values ('Physics');
insert into Subjects (subject_name) values ('Programming');
Truncate table Examinations;
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Programming');
insert into Examinations (student_id, subject_name) values ('2', 'Programming');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Programming');
insert into Examinations (student_id, subject_name) values ('13', 'Physics');
insert into Examinations (student_id, subject_name) values ('2', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Math');

-- Ans:
SELECT s.student_id, s.student_name, subj.subject_name,
COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM (Students AS s
CROSS JOIN Subjects AS subj)
LEFT JOIN Examinations AS e ON s.student_id = e.student_id AND subj.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, subj.subject_name
ORDER BY s.student_id, subj.subject_name;
