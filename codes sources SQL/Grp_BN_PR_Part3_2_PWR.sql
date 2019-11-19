USE [master]
GO

CREATE LOGIN [PowerUser] WITH PASSWORD=N'Tigrou007', DEFAULT_DATABASE=[examenJuin], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
ALTER SERVER ROLE [dbcreator] ADD MEMBER [PowerUser]
GO

USE [examenJuin]
GO

CREATE USER [PowerUser] FOR LOGIN [PowerUser] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [db_owner] ADD MEMBER [PowerUser]
GO