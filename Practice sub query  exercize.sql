-- SUB QUERY QUESTION IN W3 RESOURCES------------------------------------
use sample_db;
--  1. Write a query to find  the name (first_name , last_name ) of all employees  who works in IT department
select emp_name 
from employees
where department_id in (select dep_id  from department where dep_name = 'IT');
-- 2 . write a query to find the name (first_name ,last_name )of the employees who have a manager and worked in a USA based on department
select emp_name 
from employees 
where emp_id in (select manager_id 
from employees where department_id
in (select dep_id from department where Location_id 
in (select location_id from location where country = 'USA')));

select * from location;

select e.emp_name
from employees as m
inner join employees as e on
m.manager_id = e.emp_id
inner join department as d on
e.department_id = d.dep_id
inner join  location as l on
d.location_id = l.location_id
where country = 'USA'
group by emp_name;

-- 3. Write a three 3 join in a one statements
select e.* , m.emp_name as managers  ,m.salary as empsalary
from employees as e
left join employees as m
on e.manager_id = m.emp_id
left join department as d
on e.department_id = d.dep_id
left join location as l
on d.location_id = l.location_id
where e.salary > m.salary;

-- 4. 4. Write a query to find the name (first_name, last_name) of the employees who are managers.
-- Sample table: employees
select first_name , last_name  
from employees 
where emp_id in (select manager_id from employees );

-- 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
-- Sample table: employee
select * from employees;                    
select emp_name ,last_name , salary
from employees
where salary >(select avg(salary) from employees);

-- 6. Write a query to find the name (first_name, last_name) and the salary of the employees 
-- who have a higher salary than the employee whose last_name='Bull'.
select * from employees;
 select emp_name ,last_name ,salary
 from employees
 where salary > 
 (select salary  from employees where last_name  = 'krishna');
 
 
 select last_name ,max(salary)
 from employees
 where last_name = 'krishna' 
 group by last_name ,salary
 having max(salary) >= 15000;
 
 -- 7 Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
 select * from employees;
 select * from department;
 select emp_name ,last_name 
 from employees 
 where department_id in (select dep_id from department as d where dep_name = 'Analytics');
 
 select emp_name ,last_name
 from employees as e
 inner join department as d
 on e.department_id = d.dep_id
 where d.dep_name = 'Analytics';
 
 
-- 8.Write a query to find the name (first_name, last_name), and salary of the employees 
-- whose salary is equal to the minimum salary for their job grade.?
select * from user_table 
select * from order_table






