/*
** Example Restore
*/

SET NOCOUNT ON
GO

USE master
GO

PRINT 'Executing `restore.sql` ...'

RESTORE DATABASE AdventureWorks2017
FROM DISK = N'/usr/config/backups/AdventureWorks2017.bak'
WITH FILE = 1,
  MOVE N'AdventureWorks2017'
    TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',
  MOVE N'AdventureWorks2017_log'
    TO N'/var/opt/mssql/data/AdventureWorks2017_log.mdf',
  STATS = 5;

GO

PRINT '`restore.sql` fin.'