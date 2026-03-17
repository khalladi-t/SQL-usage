#Identify the running session, waits, CPU, reads

SELECT
    r.session_id,
    r.status,
    r.command,
    r.cpu_time,
    r.total_elapsed_time,
    r.wait_type,
    r.reads,
    r.logical_reads,
    r.writes,
    r.granted_query_memory,
    DB_NAME(r.database_id) AS database_name,
    s.program_name,
    s.login_name
FROM sys.dm_exec_requests r
JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
WHERE r.session_id <> @@SPID
ORDER BY r.total_elapsed_time DESC;
