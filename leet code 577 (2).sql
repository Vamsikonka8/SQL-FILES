use sample_db;
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

-- Input: 

-- Output: 
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+

CREATE Table Employees1(
empId        int     ,
 e_name      varchar(50) ,
 supervisor   int   ,  
 salary       int     );
drop table bonus;
create table bonus(

 empId        int , 
bonus       int  );

insert into Employees1 values
( 3     , 'Brad'   , null       , 4000   ),
( 1     , 'John'   , 3          , 1000   ),
( 2     , 'Dan'   , 3          , 2000   ),
( 4     , 'Thomas' , 3          , 4000   );


insert into bonus values
( 2     , 500   ),
( 4    , 2000  );

SELECT * FROM employees1;

SELECT * FROM bonus;


-- SOLUTION
SELECT E.name , B.bonus
FROM Employees1 as E
LEFT JOIN Bonus as B on 
E.empId = B.empId
where bonus is null or bonus < 1000;



 
    
	