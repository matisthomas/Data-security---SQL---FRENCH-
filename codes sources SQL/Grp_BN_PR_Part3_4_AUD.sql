-- Creation de l'audit sur les donnees sensibles

USE [master]
GO
CREATE SERVER AUDIT [4_audit_informations]
TO FILE 
(	FILEPATH = N'C:\sqllog\'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
	,AUDIT_GUID = 'ca488683-c90d-4969-ae4e-939ccdabce6a'
)
ALTER SERVER AUDIT [4_audit_informations] WITH (STATE = ON)
GO


USE [examenJuin]
GO
-- Audit sur la suppression, l'ajout et la modification des donnees de la table Personne
CREATE DATABASE AUDIT SPECIFICATION [Audit_specification_Personne]
FOR SERVER AUDIT [4_audit_informations]
ADD (DELETE ON OBJECT::[dbo].[Personne] BY [public]),
ADD (INSERT ON OBJECT::[dbo].[Personne] BY [public]),
ADD (UPDATE ON OBJECT::[dbo].[Personne] BY [public])
WITH (STATE = ON)
GO


