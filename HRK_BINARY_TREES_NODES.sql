USE sample_db;

create table BST (

N INT , 

P INT );


INSERT INTO BST VALUES
(1 , 2),
(3 , 2),
(6 , 8),
(9 , 8),
(8 , 5),
(8 , 5),
(5 , NULL);

SELECT * FROM BST;

SELECT *, CASE WHEN 2 = N THEN "LEAF" ELSE 0 END
		
FROM BST