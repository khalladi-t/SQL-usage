SELECT
    q.query_id,
    p.plan_id,
    p.is_forced_plan,
    p.last_execution_time
FROM sys.query_store_query q
JOIN sys.query_store_plan p ON q.query_id
