Use sample_db;

-- 577. Employee Bonus
-- Solved
-- Easy
-- Topics
-- Companies
-- Hint
-- SQL Schema
-- Pandas Schema
-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
-- empId is the column with unique values for this table.
-- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
--  

-- Table: Bonus

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
-- empId is the column of unique values for this table.
-- empId is a foreign key (reference column) to empId from the Employee table.
-- Each row of this table contains the id of an employee and their respective bonus.
--  

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.

-- The result format is in the following example.
--  
-- Example 1:
-- Output: 
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+

SELECT * FROM employees1;
SELECT * FROM bonus;

-- solution

SELECT e.e_name , b.bonus

FROM  employees1 as e

LEFT JOIN bonus as b on 

e.empId = b.empId

where b.bonus < 1000 or b.bonus is null



