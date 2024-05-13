-- token_pair
-- block_date
-- total_amount_usd
-- daily_tx_count
-- daily_unique_bought_address_count
-- daily_unique_sold_address_count

WITH top_pairs AS (
    SELECT
        token_pair,
        block_date,
        SUM(amount_usd) AS total_amount_usd,
        COUNT(DISTINCT tx_hash) AS total_tx,
        COUNT(DISTINCT token_bought_address) AS unique_bought_address,
        COUNT(DISTINCT token_sold_address) AS unique_sold_address
    FROM (
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v2_ethereum.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_ethereum.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_arbitrum.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_polygon.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_base.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_optimism.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_bnb.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v3_celo.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap_v1_ethereum.trades
        UNION ALL
        SELECT token_pair, block_date, amount_usd, tx_hash, token_bought_address, token_sold_address
        FROM uniswap.trades
    ) AS all_trades
    WHERE token_pair IN ('WBTC-WETH', 'USDC-WETH', 'DAI-WETH')
    GROUP BY token_pair, block_date
    ORDER BY block_date, total_amount_usd DESC
)

SELECT
    tp.token_pair,
    tp.block_date,
    tp.total_amount_usd,
    tp.total_tx AS daily_tx_count,
    tp.unique_bought_address AS daily_unique_bought_address_count,
    tp.unique_sold_address AS daily_unique_sold_address_count
FROM
    top_pairs tp
ORDER BY tp.block_date, tp.total_amount_usd DESC;
