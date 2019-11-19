-- Creation d'un audit sur la connexion de tous les utilisateurs
USE [master]
GO


CREATE SERVER AUDIT [login_audit]
TO FILE 
(	FILEPATH = N'C:\sqllog\'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 0
	,ON_FAILURE = CONTINUE
	,AUDIT_GUID = '007685a7-2476-41f7-83b8-401d23b83d91'
)
WHERE
(
    
)
ALTER SERVER AUDIT [login_audit] WITH (STATE = ON)
GO


CREATE SERVER AUDIT SPECIFICATION [succ_fail_login_Admin]
FOR SERVER AUDIT [login_audit]
ADD (FAILED_LOGIN_GROUP),
ADD (SUCCESSFUL_LOGIN_GROUP)
WITH (STATE = ON)
GO