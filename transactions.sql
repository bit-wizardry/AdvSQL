/*

Jesse Golembiesky | Advanced SQL | Transactions

Assignment:

Create Two Transactions they should both have multiple SQL statements in 
them that manipulate date in your DB. On the first one should work correctly 
via a combinations of updates/deletes/inserts. The second one your create 
should Auto Rollback due to an error on the second or third statement. 
For Example the transactions should have an insert or an update and then 
have a delete or an update that fails due to a Foreign Key constraint. Send 
me the code to both I should be able to run both and see that the second 
transaction does not complete the first SQL statement in it due to the Rollback. 
If you have any questions please let me know.  


*/
USE SE398_JGolembiesky;
GO

BEGIN TRANSACTION

UPDATE films
SET film_name = 'Star Wars: Han Solo'
WHERE film_id = 4;

GO

DELETE FROM films
WHERE film_id = 8;

GO

INSERT INTO films
VALUES (88,'Simpsons Movie', 8, 8, '2011-10-10');


COMMIT WORK

USE SE398_JGolembiesky;
GO

SELECT * 
FROM films
WHERE film_id = 88;

GO
/*
-- #2
BEGIN TRANSACTION

UPDATE films
SET film_name = 'Star Wars: The Last Jedi'
WHERE film_id = 5;

GO

DELETE FROM films
WHERE film_id = 7;

GO

INSERT INTO films
VALUES (89,'Futurama the Movie', 100, 8, '2011-10-10');


COMMIT WORK

SELECT * 
FROM films
WHERE film_id = 5;


*/

