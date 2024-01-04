USE Sample_DB;

CREATE TABLE movies (
id INT,
stream_date DATE, 
movie VARCHAR (50), 
director VARCHAR (50), 
Number_of_streams INT, 
ticket_price INT,
discount_per_ticket INT,
screening_cost_per_stream INT
);

DELETE FROM movies;

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

SELECT * FROM movies;

-- Q1. Change the director "Coen brothers" to "Young brothers".

-- Q2. Change the director "Coen brothers" to "Young brothers" only for Fargo movie.

-- Q3. Get the first three letters of director and make them capital.

-- Q4. Get the first name of director. (Hint: Find the occurence of the first space)

-- Q5. Get the last name of director. Get the last word from the movie.


-- Q6. Divide Number_of_streams by id. 
		-- Did you notice anything strange? What can be done to resolve the issue?

-- Q7. Write a query to get records where the length of the movie greater than or equal to 8.

-- Q8. Get details of records where first name of director is greater than 4.

-- Q9. Get records from alternative rows.

-- Q10. Create a column to get both movie and director. For example: "Fargo - Coen brothers".

-- Q10. Remove last three characters for the director name.

-- Q11. Get the records which have smallest movie name.

-- Q12. Get the records where the movie name contains character "o" after 2nd character.

-- Q13. Show the Revenue in thousands.
		-- Revenue = Number_of_streams * ticket_price * 100 (assuming 100 tickets are sold for each stream)


-- PUSH YOU LIMITS--
CREATE TABLE icc_world_cup
(
Team_1 VARCHAR(20),
Team_2 VARCHAR(20),
Winner VARCHAR(20)
);

INSERT INTO icc_world_cup values
('India','SL','India'),
('SL','Aus','Aus'),
('SA','Eng','Eng'),
('Eng','NZ','NZ'),
('Aus','India','India');

SELECT * FROM icc_world_cup;

-- Create three columns - Matches_played, No_of_wins, No_of_losses

