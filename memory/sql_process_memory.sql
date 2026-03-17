SELECT
    physical_memory_in_use_kb / 1024.0 AS sqlserver_memory_mb,
    memory_utilization_percentage,
    available_commit_limit_kb / 1024.0 AS available_commit_limit_mb,
    process
