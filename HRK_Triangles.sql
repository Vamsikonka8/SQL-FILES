use sample_db;

Create table Triangle(
A int , 
B int , 
C int );

insert into Triangle values(
20 , 20 , 23),
(20 , 20 , 20),
(20 , 21 , 22) , 
(13, 14 , 30);

select * from Triangle;

	select 
	case 
	when A = B and B = C then "Equiletral" 
	when (A = B or B = C OR C = A ) AND (A + B > C AND B + C > A AND A + C > B) then "Isosceles"
    when A <> B AND B <> C AND A <> C AND (A +B  > C AND B + C > A AND A + C > B) THEN "Scalene"
	Else "Not a Triange"
	end as Triangetype
	FROM Triangle;
    


