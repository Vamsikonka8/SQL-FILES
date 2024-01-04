USE sample_db

-- 185. Department Top Three Salaries
-- Hard
-- Topics
-- Companies
-- SQL Schema
-- Pandas Schema
-- Table: Employee

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key (column with unique values) for this table.
-- departmentId is a foreign key (reference column) of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
--  

-- Table: Department

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of a department and its name.
--  

-- A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

-- Write a solution to find the employees who are high earners in each of the departments.

-- Return the result table in any order.

-- The result format is in the following example.

--  

-- Example 1:


Create Table Employee5 (
 id int,
 name   varchar(20),
 salary int, 
 departmentId  int ;
 
 INSERT INTO Employee5 Values(
 1  , "Joe"   , 85000  , 1            ),
( 2  , "Henry" , 80000  , 2            ),
( 3  , "Sam"   ,60000  , 2            ),
( 4  , "Max"   , 90000  , 1            ),
( 5  , "Janet" , 69000  , 1            ),
( 6  , "Randy" , 85000 , 1            ),
( 7  , "Will"  , 70000  , 1            );


CREATE TABLE Department1 (
 id INT ,
 name  VARCHAR(20));
 
 INSERT INTO Department1 values(
1  , "IT"    ),
( 2  , "Sales" 