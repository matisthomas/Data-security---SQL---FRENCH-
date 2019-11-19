-- Selection de toutes les sorties de l'audit qui se sont passé durant les dernières 24H
SELECT * 
FROM sys.fn_get_audit_file ('C:\sqllog\4_*',default,default)
WHERE event_time > DATEADD(day, -1,SYSDATETIME());  
GO