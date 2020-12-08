/*

Enter custom T-SQL here that would run after SQL Server has started up. 

*/

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'HelloWorld')
BEGIN
  CREATE DATABASE HelloWorld;
END;
GO
