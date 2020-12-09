/*
** Custom T-SQL Here
** See `install-northwinds.sql` for more detailed example.
*/

SET NOCOUNT ON
GO

USE master
GO

PRINT 'Executing `setup.sql` ...'

IF EXISTS (
  SELECT *
  FROM sysdatabases
  WHERE name = N'HelloWorld'
)
PRINT 'Dropping `HelloWorld` db ...'
DROP DATABASE HelloWorld
GO

PRINT 'Creating `HelloWorld` db ...'
CREATE DATABASE HelloWorld
GO

PRINT '`setup.sql` fin.'
