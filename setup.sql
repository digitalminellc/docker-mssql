/*
  Enter custom T-SQL here
*/

IF NOT EXISTS (
  SELECT NAME
  FROM master.dbo.sysdatabases
  WHERE NAME = N'HelloWorld'
)
BEGIN
  CREATE DATABASE HelloWorld;
END;
GO
