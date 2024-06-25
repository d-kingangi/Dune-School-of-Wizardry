--resulting columns

-- block_date
-- trade
-- total_volume_usd
-- total_fee_us
-- num_transactions
-- num_traders


WITH combined_perpetual_trades AS (
    SELECT
        block_date,
        trade,
        volume_usd,
        fee_usd,
        tx_hash,
        trader
    FROM gmx_arbitrum.perpetual_trades
    UNION ALL
    SELECT
        block_date,
        trade,
        volume_usd,
        fee_usd,
        tx_hash,
        trader
    FROM gmx.perpetual_trades
    UNION ALL
    SELECT
        block_date,
        trade,
        volume_usd,
        fee_usd,
        tx_hash,
        trader
    FROM gmx_avalanche_c.perpetual_trades
),
daily_trade_analysis AS (
    SELECT
        block_date,
        trade,
        SUM(volume_usd) AS total_volume_usd,
        SUM(fee_usd) AS total_fee_usd,
        COUNT(DISTINCT tx_hash) AS num_transactions,
        COUNT(DISTINCT trader) AS num_traders
    FROM combined_perpetual_trades
    GROUP BY block_date, trade
)
SELECT
    block_date,
    trade,
    total_volume_usd,
    total_fee_usd,
    num_transactions,
    num_traders
FROM
    daily_trade_analysis
ORDER BY
    block_date,
    trade;
