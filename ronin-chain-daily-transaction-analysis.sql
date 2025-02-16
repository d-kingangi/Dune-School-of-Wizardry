WITH daily_stats AS (
    SELECT
        DATE(block_time) as date,
        COUNT(*) as total_transactions,
        COUNT(DISTINCT "from") as unique_sender_wallets,
        COUNT(DISTINCT "to") as unique_receiver_wallets,
        COUNT(DISTINCT 
            CASE 
                WHEN "to" IS NOT NULL AND "from" IS NOT NULL 
                THEN CONCAT(CAST("from" AS VARCHAR), CAST("to" AS VARCHAR))
            END
        ) as total_interactions,
        SUM(CASE WHEN success = true THEN 1 ELSE 0 END) as successful_transactions,
        AVG(gas_used) as avg_gas_used
    FROM 
        ronin.transactions
    WHERE 
        "from" IS NOT NULL 
        AND "to" IS NOT NULL
    GROUP BY 
        DATE(block_time)
)

SELECT 
    date,
    total_transactions,
    unique_sender_wallets,
    unique_receiver_wallets,
    successful_transactions,
    ROUND(successful_transactions * 100.0 / NULLIF(total_transactions, 0), 2) as success_rate,
    ROUND(avg_gas_used, 2) as average_gas_used,
    ROUND(
        (total_transactions - LAG(total_transactions, 1) OVER (ORDER BY date)) * 100.0 / 
        NULLIF(LAG(total_transactions, 1) OVER (ORDER BY date), 0),
        2
    ) as daily_transaction_growth_percent
FROM 
    daily_stats
ORDER BY 
    date DESC;