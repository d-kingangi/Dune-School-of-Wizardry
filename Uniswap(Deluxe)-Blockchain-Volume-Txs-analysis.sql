-- blockchain
-- block_date
-- total_amount_usd
-- daily_tx_count

SELECT
    blockchain,
    block_date,
    SUM(amount_usd) AS total_amount_usd,
    COUNT(DISTINCT tx_hash) AS daily_tx_count
FROM (
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v2_ethereum.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_ethereum.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_arbitrum.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_polygon.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_base.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_optimism.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_bnb.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v3_celo.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap_v1_ethereum.trades
    UNION ALL
    SELECT blockchain, block_date, amount_usd, tx_hash
    FROM uniswap.trades
) AS all_trades
GROUP BY blockchain, block_date
ORDER BY blockchain, block_date;
