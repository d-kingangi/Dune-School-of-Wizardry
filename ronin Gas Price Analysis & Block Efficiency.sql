WITH block_efficiency AS (
    SELECT 
        DATE_TRUNC('hour', b.time) as hour,
        AVG(b.gas_used * 100.0 / NULLIF(b.gas_limit, 0)) as block_utilization_percent,
        AVG(t.gas_price) as avg_gas_price,
        COUNT(DISTINCT t.hash) as num_transactions,
        AVG(b.base_fee_per_gas) as avg_base_fee
    FROM ronin.blocks b
    LEFT JOIN ronin.transactions t ON DATE_TRUNC('hour', t.block_time) = DATE_TRUNC('hour', b.time)
    GROUP BY DATE_TRUNC('hour', b.time)
)
SELECT 
    hour,
    ROUND(block_utilization_percent, 2) as block_utilization_percent,
    ROUND(avg_gas_price / 1e9, 2) as avg_gas_price_gwei,
    num_transactions,
    ROUND(avg_base_fee / 1e9, 2) as avg_base_fee_gwei
FROM block_efficiency
ORDER BY hour DESC;
