#Compare performance before vs after a regression date

DECLARE @CutoverDate datetime2 = 'YYYY-MM-DD';

SELECT
    CASE
        WHEN rsi.start_time < @CutoverDate THEN 'Before Cutover'
        ELSE 'After Cutover'
    END AS period,
    COUNT(*) AS executions,
    AVG(rs.avg_duration) / 1000000.0 AS avg_duration_seconds,
    AVG(rs.avg_cpu_time) / 1000000.0 AS avg_cpu_seconds
FROM sys.query_store_query q
JOIN sys.query_store_plan p ON q.query_id = p.query_id
JOIN sys.query_store_runtime_stats rs ON p.plan_id = rs.plan_id
JOIN sys.query_store_runtime_stats_interval rsi
    ON rs.runtime_stats_interval_id = rsi.runtime_stats_interval_id
WHERE q.object_id = OBJECT_ID('dbo.<job>)
GROUP BY
    CASE
        WHEN rsi.start_time < @CutoverDate THEN 'Before Cutover'
        ELSE 'After Cutover'
    END;
``
