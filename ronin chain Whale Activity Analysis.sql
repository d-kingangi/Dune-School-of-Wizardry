WITH whale_txns AS (
    SELECT 
        DATE(block_time) as date,
        "from" as wallet,
        COUNT(*) as num_transactions,
        SUM(CAST(value AS DOUBLE)) / 1e18 as total_value_transferred,
        AVG(CAST(value AS DOUBLE)) / 1e18 as avg_value_per_txn
    FROM ronin.transactions
    WHERE success = true
    GROUP BY DATE(block_time), "from"
    HAVING SUM(CAST(value AS DOUBLE)) / 1e18 > 1000  
)
SELECT 
    date,
    COUNT(DISTINCT wallet) as num_active_whales,
    SUM(num_transactions) as total_whale_transactions,
    ROUND(SUM(total_value_transferred), 2) as total_value_moved,
    ROUND(AVG(avg_value_per_txn), 2) as avg_transaction_size
FROM whale_txns
GROUP BY date
ORDER BY date DESC;