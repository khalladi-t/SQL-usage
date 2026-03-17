#show historical runtimes per job step 
    
USE msdb;
GO

DECLARE @JobName sysname = N'<name>';

SELECT
    j.name AS job_name,
    h.step_id,
    h.step_name,
    run_datetime =
        DATETIMEFROMPARTS(
            h.run_date / 10000,
            (h.run_date % 10000) / 100,
            h.run_date % 100,
            h.run_time / 10000,
            (h.run_time % 10000) / 100,
            h.run_time % 100,
            0
        ),
    run_duration_hhmmss = RIGHT('000000' + CAST(h.run_duration AS varchar(6)), 6),
    duration_minutes =
        ((h.run_duration / 10000) * 3600 +
        ((h.run_duration % 10000) / 100) * 60 +
        (h.run_duration % 100)) / 60.0
FROM dbo.sysjobhistory h
JOIN dbo.sysjobs j ON h.job_id = j.job_id
WHERE j.name = @JobName
  AND h.step_id > 0
ORDER BY run_datetime DESC;
