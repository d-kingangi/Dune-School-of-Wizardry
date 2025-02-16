WITH user_patterns AS (
    SELECT 
        "from" as wallet,
        COUNT(*) as total_txns,
        COUNT(DISTINCT DATE(block_time)) as active_days,
        MAX(block_time) as last_activity,
        MIN(block_time) as first_activity,
        SUM(CASE WHEN success THEN 1 ELSE 0 END) as successful_txns,
        AVG(gas_used) as avg_gas_used,
        COUNT(DISTINCT "to") as unique_interactions
    FROM ronin.transactions
    GROUP BY "from"
    HAVING COUNT(*) >= 5  -- at least 5 transactions
)
SELECT 
    CASE 
        WHEN total_txns >= 100 THEN 'Power User'
        WHEN total_txns >= 50 THEN 'Active User'
        WHEN total_txns >= 20 THEN 'Regular User'
        ELSE 'Casual User'
    END as user_category,
    COUNT(*) as num_users,
    ROUND(AVG(total_txns), 2) as avg_transactions,
    ROUND(AVG(active_days), 2) as avg_active_days,
    ROUND(AVG(successful_txns * 100.0 / total_txns), 2) as avg_success_rate,
    ROUND(AVG(unique_interactions), 2) as avg_unique_interactions
FROM user_patterns
GROUP BY 
    CASE 
        WHEN total_txns >= 100 THEN 'Power User'
        WHEN total_txns >= 50 THEN 'Active User'
        WHEN total_txns >= 20 THEN 'Regular User'
        ELSE 'Casual User'
    END
ORDER BY avg_transactions DESC;