/*
Stored Procedures
Jesse Golembiesky
*/
USE SE398_JGolembiesky;
GO

/*
--#1 Search by Name, Input String Return Rows
CREATE PROC search_film_by_name
@film_name nvarchar(100)

AS 
BEGIN
SELECT film_id, film_name 
FROM films
WHERE film_name
LIKE '%' + @film_name + '%'
ORDER BY film_name
DESC
END
PRINT 'DONE';
GO

EXEC search_film_by_name 'John';
GO

*/
--#2 Return Mean Age of Films in Database
/*
CREATE PROC mean_age_of_film
@age FLOAT OUT

AS 
BEGIN 
DECLARE @age_sum INT
DECLARE @film_count INT
DECLARE @average_age FLOAT

SELECT @age_sum = SUM(DATEDIFF(year,release_date,GETDATE()))
FROM films;

SELECT @film_count = COUNT(film_id)
FROM films;
SELECT @average_age = @age_sum / @film_count;
RETURN @average_age;
END
GO


DECLARE @age FLOAT
EXEC @age = mean_age_of_film @age OUTPUT;

PRINT 'Average Film Age: ' + CONVERT(CHAR(6),@age)  + ' Years';

GO

*/

--#3 Films By Director by ID
/*
CREATE PROC films_by_director_id @id INT
AS 
BEGIN 
SELECT film_id, film_name
FROM films
WHERE director_id = @id;
END
GO

DECLARE @director_id INT = 2
EXEC films_by_director_id @director_id;
GO
*/