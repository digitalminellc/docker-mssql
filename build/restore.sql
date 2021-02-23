/*
** Example Restore
*/

SET NOCOUNT ON
GO

USE master
GO

PRINT 'Executing `restore.sql` ...'

/*
  AdventureWorks2017
*/
IF DB_ID('AdventureWorks2017') IS NOT NULL
  PRINT 'AdventureWorks2017 exists'
ELSE
  BEGIN 
    PRINT 'Restoring AdventureWorks2017 ...'

    RESTORE DATABASE AdventureWorks2017
    FROM DISK = N'/var/opt/mssql/backup/AdventureWorks2017.bak'
    WITH FILE = 1,
      MOVE N'AdventureWorks2017'
        TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',
      MOVE N'AdventureWorks2017_log'
        TO N'/var/opt/mssql/data/AdventureWorks2017_log.mdf',
      STATS = 5;
    
    PRINT 'AdventureWorks2017 restored!'
  END
GO

PRINT '`restore.sql` fin.'