--Advanced SQL, Triggers, Jesse Golembiesky
USE SE398_JGolembiesky;
GO
SET NO COUNT
GO
/*
--#1 DML
CREATE TRIGGER tr_film_insert 
ON films 
FOR INSERT
AS
BEGIN 
DECLARE @film_name nvarchar(100);
SELECT @film_name = inserted.film_name FROM INSERTED inserted;

IF ( 
SELECT COUNT(*)
FROM films
WHERE film_name = @film_name) > 1 
BEGIN
PRINT 'Error: Film already exists';
ROLLBACK TRANSACTION;
END
END
GO

INSERT INTO films (film_id, film_name, director_id, producer_id, release_date) 
VALUES (22, 'Warcraft', 9, 7, '2016-06-10');

GO
*/
/*
--#2 DDL
CREATE TRIGGER tr_create_table
ON DATABASE
FOR CREATE_TABLE
AS 
BEGIN
PRINT 'Error: Unable to create table. We already are tracking enough media. Thank you.';
ROLLBACK TRANSACTION;
END
GO

CREATE TABLE books (book_id int primary key not null, book_name nvarchar(100) NOT NULL);

GO
*/
--#3 Logon
/*
DROP TABLE insert_log;
GO

CREATE TABLE insert_log ( --drop previous trigger if necessary to create the audit table
    log_date DATETIME NOT NULL,
    );
GO

CREATE TRIGGER tr_insert_films_log
ON films
FOR UPDATE
AS 
BEGIN
  INSERT INTO insert_log (log_date)
    VALUES (GETDATE())
END;
GO
*/

UPDATE films 
SET film_name = 'Toy Story 4'
WHERE film_id = 27;
GO

SELECT * FROM dbo.insert_log;