create database QUES_ANS;

-- 1.)STARTING WITH 'a'  
	 SELECT cus_name 
	 FROM pattern
     where cus_name like 'a%';
     
-- 2.) names ending wth 'a'
	 SELECT cus_name 
	 FROM pattern
	where cus_name like '%a';
    

-- 3.) ALL customers that have 'abc' in any position
	 SELECT cus_name 
	 FROM pattern 
	where cus_name like '%abc%';
     
     
     -- 4 customers that have 'a' 'b' or 'c' in any position
	 SELECT cus_name 
	 FROM pattern 
    where cus_name like  '%a%' or '%b%' or '%c%';
     

-- 4.) ALL CUSTOMERS THAT HAVE 's' in second position
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '_s%';
     

-- 5.)ALL CUSTOMERS THAT START WITH 'a'  and ATLEAST 3 CHARACTERS IN LENGTH
	 SELECT cus_name 
	 FROM pattern
     where cus_name like 'a%___';
     

-- 6.) ALL CUSTOMERS THAT START WITH 's' and end with 'a'-- IMPORTANT
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like 's%a';
     

-- 7.)ALL CUSTOMERS NAME THAT DO NOT START WITH 'a'
	 SELECT cus_name 
	 FROM pattern
     where cus_name not like 'a%';
  

-- 8.) ALL CUSTOMERS WITH FIRST CHARACTER IS A LETTER IN THE RANGE 'a' through 'f'
	 SELECT cus_name 
	 FROM pattern
     where cus_name  regexp '^[a-f]';
     

-- 9.) ALL CUSTOMERS CONTAINING EXACTLY 5 CHARACTERS
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '_____';
    --  where length(cus_name) = 5
	
-- 10.) ALL CUSTOMERS THAT START WITH 'abc' or 'pqr'
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like 'abc%' or cus_name like 'pqr%';
    

-- 11.) ALL CUSTOMER NAMES THAT END WITH 'th' or end with 'ha' or end with 'ri' and are of length 5
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '___th' or cus_name like '___ha' or cus_name like '___ri';
     
-- 12. Change the director "Coen brothers" to "Young brothers".
	select director ,replace(director ,'Coen' , 'young') as newname
    from movies;
    
-- 13. Change the director "Coen brothers" to "Young brothers" only for Fargo movie.
	select director , replace(director ,'Coen' ,'Young') as newname
	from movies
	where movie = 'Fargo';
    
-- 14. Get the first three letters of director and make them capital.
	SELECT director ,upper(LEFT(director ,3)) as newname
    from movies;
-- 15. Get the first name of director. (Hint: Find the occurence of the first space)
	SELECT director, left (director ,instr(director , ' ')-1) as newname
    from movies;
-- 16. Get the last name of director. Get the last word from the movie.
    SELECT director ,substring(director ,instr(director , ' ')+1) as newname
    from movies;
    SELECT directot , substring(director , 5 )
    from movies
    
	select director , reverse(left(reverse(director),instr(reverse(director),' ')))
    from movies;
   select director ,right(director ,length(director) -instr(director,' '))
   from movies;
   
-- 17. Divide Number_of_streams by id. 
-- Did you notice anything strange? What can be done to resolve the issue?
select *  ,(Number_of_streams / id)
from movies;
-- 18. Write a query to get records where the length of the movie greater than or equal to 8.
SELECT movie
from movies
where length(movie) >=8;

-- 19. Get details of records where first name of director is greater than 4.
SELECT director
from movies
where length(left(director ,instr(director ,' ')) > 4);
-- 20. Get records from alternative rows.
select id , director
from movies
where id % 2 = 0;
-- 21. Create a column to get both movie and director. For example: "Fargo - Coen brothers".
select movie , director ,concat_ws( ' - ' , movie , director)
from movies;
-- 21. Remove last three characters for the director name.
	select director ,substring(director , length(director) -2 )
	from movies;
	select director , Right(director , 3)
	from movies;
-- 22. Get the records which have smallest movie name.
SELECT * 
from movies
where movie = (select min(movie) from movies);
-- 23. Get the records where the movie name contains character "o" after 2nd character.
SELECT movie , instr(movie ,'o')
FROM movies
where instr(movie ,'o') <= 2;
-- 24. Show the Revenue in thousands.
-- Revenue = Number_of_streams * ticket_price * 100 (assuming 100 tickets are sold for each stream)
select id , movie , (Number_of_streams * ticket_price * 100 /1000)  as namerevenue
from movies;

-- 25. --> Second highest salary in EMPLOYEES table.
select * from employees;
select  e.emp_name ,salary
from employees as e
order by salary desc
limit 1, 2;

-- 26 --> Second highest salary in each deptarmnent. Use EMPLOYEES table.
with cte as (
		select *,dense_rank() over (partition by dep_name order by salary desc) as dnk
		from employees as e
		inner join department as d
		on e.department_id = d.dep_id
)
select * 
from cte 
where dnk = 2;

-- 27 --> Lowest salary in EMPLOYEES table.
select *
from employees
order by salary
limit 1;

-- 28 -> Second Lowest salary in EMPLOYEES table.
with cte as (
	select * ,dense_rank () over ( order by salary) as dnk
	from employees
)
select * 
from cte
where dnk = 2;

-- 29 --> Find all transaction done by Shilpa. Use ORDERS table.

SELECT * FROM ORDERS;

SELECT Customer_name , order_amount
from orders
where customer_name = 'Shilpa';

-- 30 --> Find all employees who have the salary more than their manager salary. Use EMPLOYEES table.
select * from employees;
select e.* ,m.emp_name as managers
from employees as e
left join employees as m
on e.manager_id = m.emp_id
where e.salary > m.salary;

-- 31 --> Swap the genders in the ORDERS table. 
select * from orders;
update orders
set customer_gender = 
case
		when customer_gender = 'Female' then 'Male'
        when customer_gender = 'Male' then 'Female'
else customer_gender
end ;
set sql_safe_updates = 0 ;
select @@sql_safe_updates;

-- 31 --> Custom sort HAPPINESS_INDEX table. First 3 rows should be Sweden, Norway and Iceland. 
			--   Rest all countries sorted by happiness_2021 column.
select * from happiness_index  ;
with cte as (
	select * ,
	case 
	when country = 'Sweden' then 1
	when country = 'Norway' then 2
	when country = 'Iceland' then 3
	else 4
	end cust_sort
	from happiness_index    
)
select * 
from cte 
order by cust_sort;
-- 34 Find students with same marks in Physics and Chemistry
select student_id ,marks , count(marks) 
from exams
where subject in ('chemistry' , 'Physics' )  
group by student_id , marks
having count(marks) =2





















    


