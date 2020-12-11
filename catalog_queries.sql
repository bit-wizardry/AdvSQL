--Jesse Golembiesky | Advanced SQL | Catalog Queries
USE SE398_JGolembiesky;
GO
/*
--1. Produce a list of all columns in all user tables within your database. Column names must be grouped by table names.(20 Points)
SELECT t.name, c.name FROM sys.columns c
JOIN sys.tables t
ON c.object_id = t.object_id;
GO
*/
--2. Produce a list of all of the foreign keys in your database.(20 Points)
/*
SELECT foreign_key.name as [Foreign Key], primary_table.name as [Primary Table], foreign_table.name as [Foreign Table] 
FROM sys.foreign_keys foreign_key
JOIN sys.tables primary_table
ON foreign_key.referenced_object_id = primary_table.object_id
JOIN sys.tables foreign_table
ON foreign_key.parent_object_id = foreign_table.object_id; 
*/
--3. Produce a list of all users in your database.(20 Points)

/*
SELECT uid, name FROM sys.sysusers;
GO
*/

--4. Produce a count of all user tables in your database.(20 Points)
/*
SELECT COUNT(*)
FROM sys.objects
WHERE type = 'U';
GO
*/

--5. Produce a list of all of your user tables in and a count of the columns in each tables in your database.(20 Points)
/*
SELECT tab.name as Tables, col.name as Columns
FROM sys.tables tab
JOIN sys.columns col 
ON tab.object_id = col.object_id;
GO
*/


