
use sample_db;
-- 2356. Number of Unique Subjects Taught by Each Teacher
-- Easy
-- Topics
-- Companies
-- SQL Schema
-- Pandas Schema
-- Table: Teacher

+-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
-- (subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
-- Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
--  

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

-- Return the result table in any order.

-- The result format is shown in the following example.

--  

-- Example 1:

-- Input: 
-- Teacher table:
-- create table Teacher (
-- teacher_id int ,
--   subject_id int ,
--   dept_id  int );
-- insert into Teacher values (
--  1      ,     2          , 3       ),
-- (1          , 2          , 4       ),
-- ( 1          , 3          , 3       ),
-- ( 2          ,1          , 1       ),
-- (2          , 2          , 1       ),
-- ( 2          , 3          , 1       ),
-- ( 2          , 4          , 1       );

-- solution

select teacher_id, count(distinct subject_id) as cnt
from teacher
group by teacher_id

