#Prove CPU‑bound execution

SELECT
    session_id,
    cpu_time,
    total_elapsed_time,
    wait_type,
    CASE
        WHEN wait_type IS NULL AND cpu_time >= total_elapsed_time * 
