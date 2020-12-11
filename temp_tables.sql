/*
Jesse Golembiesky | Advanced SQL | Temporary Tables

Local Temporary Table (50 Points)

    Create a Local Temporary Table and pull in Data Using a SELECT INTO statement in your Database
    SELECT * FROM Your Local Temporary Table to show there is data.
    Create and execute a logical UPDATE statement to modify some or all of the Data in your Local Temporary Table.

 */
USE SE398_JGolembiesky;
GO

SELECT *
INTO #films_temp
FROM films;
GO

SELECT * FROM #films_temp;
GO

UPDATE #films_temp
SET film_name = 'Pacfic Rim'
WHERE film_id = 1;
GO

SELECT * FROM #films_temp;
GO
 /*
 
Global Temporary Table (50 Points)

    Create a  Global Temporary Table using a CREATE TABLE statement in your Database
    Use an INSERT INTO Statement to fill the Global Temporary Table with some data.
    SELECT * FROM Your Global Temporary Table to show there is data. Also SELECT the Current SPID 
    Open a new Query Window. SELECT the SPID and Then create and execute a DELETE statement to select a portion of the Global Temporary Table.
    Go back to the original query window. SELECT the SPID and then SELECT * FROM the Global Temporary Table to see the change across connections.

*/

CREATE TABLE ##films_temp(
    film_id int not null primary key,
    film_name nvarchar(100) not null
);
GO

INSERT INTO ##films_temp
VALUES
    (1, 'Rambo'),
    (2, 'Rocky'),
    (3, 'Termiantor')
    ;
GO

--Back to original window

SELECT * FROM ##films_temp;
GO