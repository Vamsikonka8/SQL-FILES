USE sample_db;


 
drop table emp_info;

CREATE TABLE emp_info (
empno INT,
ename VARCHAR(10),
job VARCHAR(9),
mgr INT,
hiredate DATE,
sal INT,
comm INT,
dept INT);

INSERT INTO emp_info VALUES
(1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4),
(2,'HARDING','MANAGER',9,'1998-02-02',52000,300,3),
(3,'TAFT','SALES I',2,'1996-01-02',25000,500,3),
(4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
(5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
(6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
(7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
(8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
(9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
(10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
(11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
(12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
(13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
(14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);

SELECT * FROM emp_info;

select ename , max(sal)
from emp_info
order by max(sal) desc
limit 2;
-- write a query to find the name (first_name , last_name ) and the salary of 
-- the employees who have a higher salary then the employees who emp_name = 'BULL'
select ename , job, sal
from emp_info
where sal > (select ename from emp_info where ename = 'TAFT' )
order by sal desc
limit 1;

  


-- Q1. Decrease one year from Hiredate.
SELECT *, ADDDATE(hiredate, INTERVAL -1 YEAR) as newdate
FROM emp_info;
	
-- Q2. Calculate the tenure of the employees (in months) in the company.
	SELECT *, TIMESTAMPDIFF(year,hiredate, current_date())
    FROM emp_info;
    
-- Q3. Extract Day, Month, Year, Weekday from hiredate.
	SELECT hiredate,
			DAY(hiredate),
            MONTH(hiredate),
            YEAR(hiredate),
            WEEKDAY(hiredate)
	FROM emp_info;
    
    
-- Q4. Find employees who were hired on Monday.
SELECT *, WEEKDAY(hiredate)
FROM emp_info
WHERE WEEKDAY(hiredate) = 0;

-- Q5. Find employees who were hired after 1996.
SELECT *
FROM emp_info
WHERE YEAR(hiredate)> 1996;
	
-- Q6. Find employees who were hired after 1996 and before 1998.
SELECT *
FROM emp_info
WHERE YEAR(hiredate)> 1996 AND YEAR(hiredate) <1998;
-- Q7. Find years where more than 2 employees were hired.
SELECT year(hiredate),count(*)
FROM emp_info
group by year(hiredate)
having count(*) > 2;


-- 1. PUSH YOUR LIMITS--

CREATE TABLE hospital ( 
emp_id INT,
action VARCHAR(10),
time DATETIME);


CREATE TABLE hospital ( 
emp_id INT,
action VARCHAR(10),
time TIMESTAMP);


INSERT INTO hospital VALUES 
('1', 'in', '2019-12-22 09:00:00'),
('1', 'out', '2019-12-22 09:15:00'),
('2', 'in', '2019-12-22 09:00:00'),
('2', 'out', '2019-12-22 09:15:00'),
('2', 'in', '2019-12-22 09:30:00'),
('3', 'out', '2019-12-22 09:00:00'),
('3', 'in', '2019-12-22 09:15:00'),
('3', 'out', '2019-12-22 09:30:00'),
('3', 'in', '2019-12-22 09:45:00'),
('4', 'in', '2019-12-22 09:45:00'),
('5', 'out', '2019-12-22 09:40:00');

SELECT * FROM hospital;

-- Write a SQL Query to find the total number of people present 
	-- inside the hospital
-- 1-out, 2-in, 3-in, 4-in, 5-out

-- Using window functions

select * 

