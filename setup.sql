/*

Enter custom T-SQL here that would run after SQL Server has started up. 

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
