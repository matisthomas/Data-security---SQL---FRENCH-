RESTORE DATABASE examenJuin
FROM DISK = '/var/opt/mssql/backup/BackupexamenJuin.bak'
WITH MOVE 'examenJuin' TO '/var/opt/mssql/data/examenJuin.mdf',
MOVE 'examenJuin_Log' TO '/var/opt/mssql/data/examenJuin_Log.ldf'
GO