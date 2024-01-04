 USE sample_db;


-- CREATE TABLE CONTEST (

-- Contest_id INT,

-- hacker_id INT,

-- name varchar(20));

-- INSERT INTO CONTEST VALUES
-- (66406 , 17973 , "Rose"),
-- (66556, 79153 , "Angela"),
-- (94828, 80275 , "Frank");


-- CREATE TABLE COLLEGE (
-- college_id  int ,
-- contest_id int );

-- INSERT INTO COLLEGE VALUES
-- (11219 , 66406),
-- (32473, 66556),
-- (56685 , 94828);

-- CREATE TABLE CHALLEGES (
-- challenge_id INT ,
-- college_id INT );

-- INSERT INTO CHALLEGES VALUES
-- (18765 , 11219),
-- (47127 , 11219),
-- (60292 , 32473),
-- (72974 , 56685);


-- CREATE TABLE VIEW_STATS (
-- challenge_id INT ,
-- total_views INT,
-- total_unique_views INT );

-- INSERT INTO VIEW_STATS VALUES
-- (47127 , 26 , 19),
-- (47127 , 15 , 14),
-- (18765 , 43 , 10),
-- (18765 , 72, 13),
-- (75516 , 35 , 17),
-- (60292 , 11 , 10),
-- (72974 , 41 , 15),
-- (75516 , 75 , 11);

-- CREATE TABLE SUBMISSION_STATS (
-- challenge_id INT ,
-- total_submissions INT,
-- total_accepted_submissions INT);

-- INSERT INTO SUBMISSION_STATS VALUES
-- (75516 , 34 , 12),
-- (47127 , 27 , 10),
-- (47127 , 56 , 18),
-- (75516 , 74 , 12),
-- (75516 , 83 , 8),
-- (72974 , 68 , 24),
-- (72974 , 82 , 14),
-- (47127 , 28 , 11 );

SELECT * FROM SUBMISSION_STATS;
SELECT * FROM VIEW_STATS ;
SELECT * FROM CHALLEGES;
SELECT * FROM COLLEGE ;
SELECT * FROM   CONTEST;

-- SOLUTION


SELECT SUM(S.total_submissions) as Total_sub , SUM(total_accepted_submissions) as total_accept
FROM CHALLEGES AS  C
INNER JOIN  SUBMISSION_STATS as S ON
C.challenge_id = S.challenge_id
GROUP BY S.challenge_id  ;

SELECT SUM(total_views) as tv , sum(total_unique_views)
FROM CHALLEGES AS  C
INNER JOIN VIEW_STATS  as V ON
C.challenge_id = V.challenge_id
GROUP BY V.challenge_id