SELECT 
    DATE(block_time) as date,
    COUNT(*) as total_txns,
    ROUND(AVG(l1_fee / 1e18), 6) as avg_l1_fee,
    ROUND(AVG(l1_gas_used), 2) as avg_l1_gas_used,
    ROUND(AVG(l1_gas_price / 1e9), 2) as avg_l1_gas_price_gwei,
    ROUND(AVG(l1_fee_scalar), 4) as avg_l1_fee_scalar,
    ROUND(SUM(l1_fee / 1e18), 2) as total_l1_fees,
    COUNT(DISTINCT l1_tx_origin) as unique_l1_origins
FROM ronin.transactions
WHERE l1_fee IS NOT NULL
GROUP BY DATE(block_time)
ORDER BY date DESC;