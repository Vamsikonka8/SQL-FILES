
use sample_db;

CREATE TABLE employees(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT,
emp_age INT);

INSERT INTO employees 
VALUES 
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);

CREATE TABLE emp(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT,
emp_age INT);

INSERT INTO emp VALUES
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50),
(1, 'Ankit', 100,10000, 4, 39);

CREATE TABLE department(
dep_id INT,
dep_name VARCHAR(20)
);

INSERT INTO department VALUES
(100, 'Analytics'),
(300, 'IT');

CREATE TABLE happiness_index 
( SL_NO INT,
country VARCHAR(55),
Happiness_2021 VARCHAR(55),
Happiness_2020 VARCHAR(55),
Population_2022 VARCHAR(55)
);

INSERT INTO happiness_index VALUES 
(1,	'Finland',	7.842,	7.809,	5554960),
(2,	'Denmark',	7.62,	7.646,	5834950),
(3,	'Switzerland',	7.571,	7.56,	8773637),
(4,	'Iceland',	7.554,	7.504,	345393),
(5,	'Netherlands',	7.464,	7.449,	17211447),
(6,	'Norway',	7.392,	7.488,	5511370),
(7,	'Sweden',	7.363,	7.353,	10218971),
(8,	'Luxembourg',	7.324,	7.238,	642371),
(9,	'New Zealand',	7.277,	7.3,	4898203),
(10, 'Austria',	7.268,	7.294,	9066710)
;

CREATE TABLE orders(
customer_name VARCHAR(20),
order_date DATE,
order_amount INT,
customer_gender VARCHAR(20));

INSERT INTO orders VALUES 
('Shilpa','2020-01-01',10000, 'Female'),
('Rahul','2020-01-02',12000, 'Male'),
('SHILPA','2020-01-03',12000, 'Female'),
('Rohit','2020-01-04',15000, 'Male'),
('Shilpa','2020-01-05',14000, 'Female');

-- Q1 --> Find max emp_id, 
		-- number of employees,
		-- number of departments,
		-- total salary
		-- max salary
		-- min salary
		-- number of managers
		-- max age of employee
	SELECT * FROM employees;
	
-- Q2 --> Solve the Q1 department wise.
-- Q3 --> Find duplicates in the EMP table.
-- Q4 --> Remove duplicates from EMP table.
-- Q5 --> Difference between union and union all. Use EMPLOYEES and EMP table.
-- Q6 --> Difference between row_number, rank and dense_rank. Use EMPLOYEES table.
-- Q7 --> Employees from EMPLOYEES table who are not present in DEPARTMENT table.
-- Q8 --> Second highest salary in EMPLOYEES table.
-- Q9 --> Second highest salary in each deptarmnent. Use EMPLOYEES table.
-- Q10 --> Lowest salary in EMPLOYEES table.
-- Q11 --> Second Lowest salary in EMPLOYEES table.
-- Q12 --> Find all transaction done by Shilpa. Use ORDERS table.
-- Q13 --> Find all employees who have the salary more than their manager salary. Use EMPLOYEES table.
-- Q14 --> Swap the genders in the ORDERS table. 
-- Q15 --> Custom sort HAPPINESS_INDEX table. First 3 rows should be Sweden, Norway and Iceland. 
			--   Rest all countries sorted by happiness_2021 column.



