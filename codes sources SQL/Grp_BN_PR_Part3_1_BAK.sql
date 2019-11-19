-- Creation d'un fichier de backup 

BACKUP DATABASE [examenJuin] TO  DISK =
N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\BackupexamenJuin.bak'
WITH NOFORMAT, NOINIT, NAME = N'examenJuin-Full backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO