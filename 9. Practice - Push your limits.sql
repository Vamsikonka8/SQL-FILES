
USE  sample_db ;
drop table UserActivity;
CREATE TABLE UserActivity
(
username VARCHAR(20) ,
activity VARCHAR(20),
startDate DATE,
endDate DATE
);
select connection_id();
INSERT INTO UserActivity VALUES 
('Alice','Travel','2020-02-12','2020-02-20'),
('Alice','Dancing','2020-02-21','2020-02-23'),
('Alice','Travel','2020-02-24','2020-02-28'),
('Bob','Travel','2020-02-11','2020-02-18');

SELECT * FROM UserActivity ;


set sql_safe_updates = 0;
-- Get the second most recent activity. If there is only one activity then return that one also.
SELECT * FROM UserActivity ;
with cte as (
	SELECT * ,
	row_number() over (partition by username order by startDate ) as rn ,
	count(*) over (partition by username ) as cnt
	FROM UserActivity
) 
SELECT * 
FROM CTE 
where rn = 2 OR cnt = 1



-- -----------------------------------------------------------
CREATE TABLE exams (
	student_id INT, 
	subject VARCHAR(20), 
	marks INT
	);

DELETE FROM exams;
drop table exams;
INSERT INTO exams VALUES 
(1,'Chemistry',91),
(1,'Physics',91),
(1,'Maths',81),
(2,'Chemistry',80),
(2,'Physics',90),
(3,'Chemistry',80),
(4,'Chemistry',71),
(4,'Physics',54),
(4,'Maths',64),
(5,'Physics',91),
(5,'Chemistry',91);

SELECT * FROM exams;
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Find students with same marks in Physics and Chemistry
select student_id ,marks , count(marks) 
from exams
where subject in ('chemistry' , 'Physics' )  
group by student_id , marks
having count(marks) =2
