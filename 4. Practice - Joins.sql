 
USE sample_db;

CREATE TABLE employees(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,           
manager_id INT,
emp_age INT);
INSERT INTO employees 
VALUES 
(1, 'Ankit', 100,10000, 4, 39, 'kumar','male'),  
(2,'Mohit', 100, 15000, 5, 48, 'krishna','female'),
(3, 'Vikas', 100, 10000,4,37,'rupesh','female'),
(4, 'Rohit', 100, 5000, 2, 16,'kumar','male'),
(5, 'Mudit', 200, 12000, 6,55 , 'krishna','male'),
(6, 'Agam', 200, 12000,2, 14, 'sai','female'),
(7, 'Sanjay', 200, 9000, 2,13, 'kumar','female'),
(8, 'Ashish', 200,5000,2,12, 'krishna','male'),
(9, 'Mukesh',300,6000,6,51, 'rohit','male'),
(10, 'Rakesh',300,7000,6,50,'krishna','female');

select * from employees;
alter table employees
drop column particals;
with cte as (
select gender ,salary ,
dense_rank() over (order by salary desc) drnk
from employees
where  gender = 'female'
)
select * 
from cte
where drnk <= 3;

select connection_id();

-- ---------------------------------------------------------------------------
alter table employees
add particals int;

CREATE TABLE department(
dep_id INT,
dep_name VARCHAR(20),
Location_id INT
);
DROP table department;
INSERT INTO department VALUES
(100, 'Analytics',1001),
(300, 'IT',1002),
(200 ,'sales forces' ,1003);
CREATE TABLE LOCATION (
Location_id int,
country varchar(20)
);
INSERT into location values
(1001, 'USA'),
(1002, 'Canada'),
(1003, 'germany');
-- #2. PUSH YOUR LIMITS
CREATE TABLE emp_2020
(
emp_id INT,
designation VARCHAR(20)
);

CREATE TABLE emp_2021
(
emp_id INT,
designation VARCHAR(20)
);

INSERT INTO emp_2020 VALUES (1,'Trainee'), (2,'Developer'),(3,'Senior Developer'),(4,'Manager');
INSERT INTO emp_2021 VALUES (1,'Developer'), (2,'Developer'),(3,'Manager'),(5,'Trainee'),( 6,'avamsie');
truncate table employees;
CREATE TABLE emp_salary
(
    emp_id INTEGER  NOT NULL,
    name VARCHAR(20)  NOT NULL,
    salary VARCHAR(30),
    dept_id INTEGER
);

INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');

-- Write a SQL query to return all employees whose salary is same in same department
	-- Using CTE
     
    
with cte as (
	select * , dense_rank() over (partition by dept_id order by salary) as rnk
	from emp_salary
),
cte1 as (
	select *, count(*) over(partition by dept_id order by salary) as cnt
	from cte
)
select *
from cte1
where rnk = 1 and cnt = 2;
	-- Using joins(inner join and left join)

SELECT * FROM employees;
SELECT * FROM department;
select * from location;
-- vamsi Practice ---------------------------------------------------------------------------------------------------------------
select first_name ,last_name ,salary
from employees
where salary > (select avg(salary) from employees);  


-- VAMSI PRACTICE--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Row_numbers is the directly give a row number, its not give repeated  row number
select * ,row_number() over (order by salary) as rownumber
from employees;
select * from employees;
-- partition by the give a group a summary row repeated value and then a give a row number aslo same type
select * , row_number() over (partition by department_id order by salary) as rownumber
from employees;

-- partion by clause divides the result set into partitionn and changes how the window 
-- function by clause doesnot reduce the numbers of rows returned
 

-- group by clause reduces the number of rows returned by rolling them up and 
-- calculating the sum or or average for each group.in group by clause is used often we can use the aggregation function .
select department_id, round(avg(salary)) as avg
from employees
group by department_id
order by department_id;

select * from employees
-- partition of emp_id its is look like
select * , row_number() over(partition by emp_id order by salary )  rownow
from employees;

-- the following statements use the rank() function 
-- to find the top second highest salary in their department salary
select * from department;
select emp_id , department_id, salary,dense_rank() over (partition by department_id order by salary) as salary_rank
from employees; 

-- Sub query ---------------------------------------------------------------------------------------
 -- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- Q1. Given EMPLOYEES and DEPARTMENT table. How many rows will be returned after using left, right, inner, full outer joins
select e.*, d.dep_name
from employees as e
inner join department as d on
e.department_id = d.dep_id ;
-- 11. Write a SQL Query to find the employees who are in Software Department
with cte as ( 
select e.* ,d.dep_name
from  employees as e , department as d
where e.department_id = d.dep_id 
) 
select * from cte 
where dep_name = 'Analytics';
-- ---------------------------------=-----------------------------------------------------------------------------------------------------
select  max(salary) as maxsalary , min(salary) as minsalary
from employees
order by maxsalary asc,
         minsalary desc;
         
-- Q2. Create new column for department name in the EMPLOYEES table
select e.* , dep_name as depnmae 
from employees as e , department as d
where e.department_id = d.dep_id;

select *
from employees as e
 left join department as d
on e.department_id = d.dep_id;

-- Q3. In case if the department does not exist, the default department should be "NA".
SELECT e.* , d.dep_name,
case 
when d.dep_name is null 
then 'NA'
ELSE d.dep_name
end as new_depname
from employees as e
left join department as d
on e.department_id = d.dep_id;

-- Q4. Find employees which are in Analytics department.
select e.*,d.dep_name
from employees as e
left join department as d
on e.department_id = d.dep_id
where d.dep_name = 'Analytics';

-- Q5. Find the managers of the employees
select e.*,v.emp_name as managers
from employees as e
left join employees as v
on e.manager_id = v.emp_id;

select e.* , m.emp_name as employees
from employees as e
right join employees as m
on e.emp_id = m.manager_id;

-- Q6. Find all employees who have the salary more than their manager salary.
select e.* , e.emp_name as manager,e.salary as msalary
from employees as e
left join employees as m
on e.manager_id = m.emp_id
where m.salary  >e.salary;

SELECT e.*, m.emp_name as manager , m.salary as employeessalary
FROM employees  as m
LEFT join employees as e
on e.manager_id = m.emp_id
where e.salary > m.salary;

-- Q7. Find number of employees in each department

select d.dep_name, count(emp_id)
from employees as e
left join department as d
on e.department_id = d.dep_id
group by d.dep_name ;

-- Q8. Find the highest paid employee in each department
WITH CTE AS (
select department_id, max(salary) as Maxsalary
from employees
group by department_id
),
cte1 as (
select c.* , e.emp_name
from cte as c
left join employees as e
on c.department_id = e.department_id and c.Maxsalary = e.salary
)
select c.* , d.dep_name
from cte1 as c
left join department as d
on c.department_id = d.dep_id;

-- Q9. Which department recieves more salary
with cte as (
select department_id, sum(salary) as total
from employees
group by department_id
)
select  department_id , total
from cte
where total = (select max(total) from cte);


-- Q10. What is cross join? What it can be used for?
SELECT *
FROM employees
cross join department;

-- Row_numbers is the directly give a row number, its not give repeated  row number
select * ,row_number() over (order by salary) as rownumber
from employees;

-- partition by the give a group a summary row repeated value and then a give a row number aslo same type
select * , row_number() over (partition by department_id order by salary) as rownumber
from employees;

-- partion by clause divides the result set into partitionn and changes how the window 
-- function by clause doesnot reduce the numbers of rows returned
select emp_id , emp_name, department_id, round(avg(salary) over (partition by department_id)) avg_department_salary
from employees;

-- group by clause reduces the number of rows returned by rolling them up and 
-- calculating the sum or or average for each group.in group by clause is used often we can use the aggregation function .
select department_id,round(avg(salary) ) avg_deparment_id
from employees
group by department_id
order by department_id;
-- partition of emp_id its is look like
select * , row_number() over(partition by emp_id order by salary)  rownow
from employees;

-- the following statements use the rank() function 
-- to find the top second highest salary in their department salary
select * from department;
select emp_id , department_id, salary,rank() over (partition by department_id order by salary) as salary_rank
from employees;













with cte as (
select *,dense_rank() over (partition by department_id order by salary desc) as rnk
from employees 
)
select *
from cte
where rnk  = 2;
select * , rank() over (order by salary desc) as rnk
from employees;







-- #1. PUSH YOUR LIMITS

CREATE TABLE emp_salary
(
    emp_id INTEGER  NOT NULL,
    name VARCHAR(20)  NOT NULL,
    salary VARCHAR(30),
    dept_id INTEGER
);


























-- mcq --


-- write a  from  station table which have vowels as their second letter vowels are aeiou
select designation
from emp_2021
where designation = substr(designation,2,1) in ('a','e');
-- write a sql query to find all the from station table 
select designation 
from emp_2021
where designation= left(designation , 0) in ('a','e') or right(designation , 0) in ( 'a', 'e');

-- Find the change in employee status.
	-- Types of status can only be - Promoted, No change, Resigned, New

-- ALTER FUNCTION  IN THE TABLE -----------------------------------------------------------------------------------------------------------
select * from employees;

truncate table employees;

ALTER TABLE employees
Rename column Gender to last_name;

alter table employees
add last_name text;

ALTER TABLE employees
add Gender Varchar(20);

select * from employees;
select first_name , last_name  
from employees 
where emp_id in (select manager_id from employees );

with cte as (
select Gender 
from employees
group by gender
)
select
case 
when Gender = 'male' then 1
when Gender = 'female' then 2
else Gender
end row_numbers  
from cte;

select * from employees;

;

SELECT *, row_number() over (partition by gender order by emp_id) as rn
FROM employees
order by rn;

select gender,
case 
when Gender = 'male' then 1
when Gender = 'female' then 2
else Gender
end row_numbers 
from employees;
-- TCL- COMMIT - SAVEPOINT- Rollback- SET TRANSACTION-set constraint =============================================================================================================================================================
select * from employees;
set autocommit = on;
set autocommit = off;
update employees
set  emp_name = 'ASHISH'
where emp_id = 1;

update employees
set  emp_name = 'RAjat'
where emp_id = 1;
Start transaction;
update employees
set  emp_name = 'prashant'
where emp_id = 1;
ROLLBACK;
SET SQL_SAFE_UPDATES = 0;
SELECT @@sql_safe_updates;

-- GRANT AND REVOKE TOPIC

GRANT all privileges
on sampledb.* to
vamsi123@localhost;

select salary from emp
REVOKE UPDATE
on sampledb.* FROM
vamsi123@localhost;





