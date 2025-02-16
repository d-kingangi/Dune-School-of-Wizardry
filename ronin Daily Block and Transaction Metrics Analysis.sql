WITH block_metrics AS (
    SELECT 
        DATE(b.time) as block_date,
        AVG(b.size) as avg_block_size,
        AVG(b.difficulty) as avg_difficulty,
        AVG(b.gas_used) as avg_block_gas_used,
        AVG(b.gas_limit) as avg_block_gas_limit,
        AVG(b.base_fee_per_gas) as avg_base_fee_per_gas,
        COUNT(*) as total_blocks,
        
        COUNT(t.hash) as total_transactions,
        COUNT(t.hash)::FLOAT / COUNT(DISTINCT b.number) as avg_txns_per_block,
        
        AVG(t.gas_price) as avg_transaction_gas_price,
        AVG(t.gas_used) as avg_transaction_gas_used,
        
        AVG(b.gas_used * 100.0 / NULLIF(b.gas_limit, 0)) as avg_block_utilization_percent
    FROM 
        ronin.blocks b
        LEFT JOIN ronin.transactions t ON b.number = t.block_number
    GROUP BY 
        DATE(b.time)
)

SELECT 
    block_date,
    ROUND(avg_block_size / 1024.0, 2) as avg_block_size_kb,
    total_blocks as blocks_produced,
    
    ROUND(avg_difficulty, 2) as avg_block_difficulty,
    
    ROUND(avg_txns_per_block, 2) as avg_transactions_per_block,
    total_transactions,
    
    ROUND(avg_transaction_gas_price / 1e9, 4) as avg_gas_price_gwei,
    ROUND(avg_base_fee_per_gas / 1e9, 4) as avg_base_fee_gwei,
    ROUND(avg_transaction_gas_used, 0) as avg_gas_used_per_tx,
    ROUND(avg_block_gas_used, 0) as avg_gas_used_per_block,
    ROUND(avg_block_gas_limit, 0) as avg_gas_limit_per_block,
    
    ROUND(avg_block_utilization_percent, 2) as block_utilization_percent,
    
    ROUND(total_transactions::FLOAT / NULLIF(total_blocks, 0), 2) as network_throughput_tx_per_block,
    ROUND((avg_block_size / 1024.0) * total_blocks, 2) as total_daily_data_mb
FROM 
    block_metrics
ORDER BY 
    block_date DESC;