
USE sampledb;
CREATE TABLE movies (
id INT,
stream_date DATE, 
movie VARCHAR (50), 
director VARCHAR (50), 
Number_of_streams INT, 
ticket_price INT,
discount_per_ticket DOUBLE,
screening_cost_per_stream INT
);
DROP TABLE movies;
INSERT INTO movies VALUES 
(1, '2022-04-01', 'Fargo', 'Coen brothers', 495, 200, 0.3, 50),
(2, '2022-04-01', 'The Big Lebowski', 'Coen brothers', 512, 300, 0.2, 60),
(3, '2022-04-01', 'No Country for Old Men', 'Coen brothers', 270, 450, 0.1, 30),
(4, '2022-04-01', 'Dogtooth', 'Yorgos Lanthimos', 157, 150, 0.05, 30),
(5, '2022-04-01', 'The Lobster', 'Yorgos Lanthimos', 247, 200, 0.25, 40),
(6, '2022-04-01', 'The Killing of a Sacred Deer', 'Yorgos Lanthimos', 320, 350, 0.3, 50),
(7, '2022-04-02', 'Fargo', 'Coen brothers', 321, 450, 0.3, 50),
(8, '2022-04-02', 'The Big Lebowski', 'Coen brothers', 905, 300, 0.2, 90),
(9, '2022-04-02', 'No Country for Old Men', 'Coen brothers', 308, 200, 0.1, 50),
(10, '2022-04-02', 'Dogtooth', 'Yorgos Lanthimos', 233, 250, 0.35, 30),
(11, '2022-04-02', 'The Lobster', 'Yorgos Lanthimos', 405, 280, 0.4, 40),
(12, '2022-04-02', 'The Killing of a Sacred Deer', 'Yorgos Lanthimos', 109, 380, 0.45, 10),
(13, '2022-04-03', 'Fargo', 'Coen brothers', 275, 500, 0.3, 50),
(14, '2022-04-03', 'The Big Lebowski', 'Coen brothers', 400, 400, 0.2, 90),
(15, '2022-04-03', 'No Country for Old Men', 'Coen brothers', 100, 600, 0.1, 50),
(16, '2022-04-03', 'Dogtooth', 'Yorgos Lanthimos', 233, 250, 0.35, 30),
(17, '2022-04-03', 'The Lobster', 'Yorgos Lanthimos', 405, 500, 0.4, 40),
(18, '2022-04-03', 'The Killing of a Sacred Deer', 'Yorgos Lanthimos', 109, 380, 0.45, 10);

select *
from movies;
-- MCQ3-------------------------------------------------------------------------------------------------------------

select movie , count(movie)
from movies
where instr(movie ,'Deer')  > 0
group by movie;

-- -------------------------------------------------------------------------------------------------------------

-- Q1. Do basic Exploratory data analysis (EDA) of the dataset. For example-
		 select 
				count(distinct movie) as distinctmovies ,  -- total columns movies in the table
				count(distinct director) as distinctdirector,-- total columns director in the table
		 		sum(number_of_streams) as numberofstreams,-- Total number of times movies were streamed
		        count(distinct stream_date) as streamdate , -- Number of days movies were streamed
				max(ticket_price) as   maxprice,
				min(ticket_price) as minprice,                 -- Highest and lowest prices of the ticket
				avg(ticket_price * discount_per_ticket) as avgdiscount                        -- Average discount per ticket (in money)
        from movies	;	
        
        select * from movies;

-- Q2. How many times movies were streamed on each day? 
select stream_date , sum(number_of_streams)
from movies
group by stream_date, director;

-- Q3. How many times movies were streamed on each day and who were the directors?

select stream_date , director , sum(number_of_streams)
from movies
group by stream_date , director;

-- Q4. Find the total number of s
select stream_date , director , sum(number_of_streams)
from movies
where number_of_streams > 20 
group by stream_date , director ;

-- Q5. Find the total number of streams by date and director. 
		-- from the above query show only dates with a total number of streams above 740.
select  stream_date , director , sum(number_of_streams)as NEWNAME
from movies
group by stream_date , director
having NEWNAME > 740 ;

select director, sum(number_of_streams)
from movies
group by director , number_of_streams
having sum(number_of_streams) > 740;

 select max(salary)
 from employees
 order by salary; 
 

-- Q5. What is the difference between COUNT(*), COUNT(expression), 
		-- and COUNT(DISTINCT expression)?
SELECT count(movie)
FROM movies;
select count(distinct movie)
from movies;
-- Q6. What will below codes return? What is the issue here?
-- Q7. Calculate total profit. Assume ticket sold per stream is 100. 
		-- Profit for one stream is-
		-- Number_of_Streams * Ticket sold * (ticket_price - (ticket_price * discount_per_ticket) - screening_cost_per_stream)
         
		select sum(Number_of_streams * 100 * (ticket_price -(ticket_price * discount_per_ticket) -  screening_cost_per_stream))
        from movies;
		
		select * from movies;
		select movie ,Number_of_streams * 100 * (ticket_price -(ticket_price * discount_per_ticket) - (Number_of_streams * screening_cost_per_stream));

-- Q8. Calculate total profit only for movie Fargo. Assume ticket sold per stream is 100.
select movie , (number_of_streams , screening_cost_per_stream, sum(number_of_streams * 100 - screening_cost_per_stream ) )as total_profit
from movies
where movie = 'fargo'
group by movie ;
-- , number_of_streams ,screening_cost_per_stream  
select movie,sum(((number_of_streams*(100*(ticket_price*discount_per_ticket)))-(number_of_streams*screening_cost_per_stream)))as total profit
from movies -- where = 'fargo'
select movie,sum((number_of_streams*(100*(ticket_price*discount_per_ticket)))-(number_of_streams*screening_cost_per_stream)) from movies where 
movie= 'fargo'
-- Q9. Calculate total profit for each day. Assume ticket sold per stream is 100.;








CREATE TABLE events (
ID INT,
event VARCHAR(255),
YEAR INt,
GOLD VARCHAR(255),
SILVER VARCHAR(255),
BRONZE VARCHAR(255)
);
DELETE FROM events;
INSERT INTO events VALUES 
(1,'100m',2016, 'Amthhew Mcgarray','donald','barbara'),
(2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith'),
(3,'500m',2016, 'Charles','Nichole','Susana'),
(4,'100m',2016, 'Ronald','maria','paula'),
(5,'200m',2016, 'Alfred','carol','Steven'),
(6,'500m',2016, 'Nichole','Alfred','Brandon'),
(7,'100m',2016, 'Charles','Dennis','Susana'),
(8,'200m',2016, 'Thomas','Dawn','catherine'),
(9,'500m',2016, 'Thomas','Dennis','paula'),
(10,'100m',2016, 'Charles','Dennis','Susana'),
(11,'200m',2016, 'jessica','Donald','Stefeney'),
(12,'500m',2016,'Thomas','Steven','Catherine');


create table DATA_VAMSI(
ID int,
NAME_1 varchar(10),
DEPT varchar(10),
SALARY int
);
DROP TABLE DATA_VAMSI;
insert into DATA_VAMSI values 
(111, 'Naveen', 'HR', 30000),
(112, 'Venky', 'MRKT', 40000),
(113, 'Shruthika','MRKT', 60000),
(114, 'Vamsi', 'HR', 40000),
(115, 'Dinesh','MRKT', 60000),
(116, 'Teja','HR', 70000),
(117, 'Poornima','HR', 50000),
(118, 'Swarna','HR', 60000),
(119, 'Santhosh','MRKT', 50000),
(120, 'Venkatesh','IT', 60000);
-- PUSH YOUR LIMITS --
-- Write a query to find number of gold medal per swimmers for swimmers who only won gold medals.
-- Subquery
-- Having by, with cte
select *
from data_vamsi
 
