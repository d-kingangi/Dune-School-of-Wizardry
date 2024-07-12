-- querying both tables


WITH base_trades AS (
    SELECT
        DATE_TRUNC('month', block_time) AS month,
        COUNT(DISTINCT tx_id) AS num_transactions_base,
        COUNT(DISTINCT trader_id) AS num_traders_base,
        NULL AS total_amount_usd_base
    FROM
        dex_solana.base_trades
    GROUP BY
        month
),
trades AS (
    SELECT
        DATE_TRUNC('month', block_time) AS month,
        COUNT(DISTINCT tx_id) AS num_transactions_trades,
        COUNT(DISTINCT trader_id) AS num_traders_trades,
        SUM(amount_usd) AS total_amount_usd_trades
    FROM
        dex_solana.trades
    GROUP BY
        month
)
SELECT
    COALESCE(b.month, t.month) AS month,
    COALESCE(num_transactions_base, 0) AS num_transactions_base,
    COALESCE(num_traders_base, 0) AS num_traders_base,
    COALESCE(total_amount_usd_base, 0) AS total_amount_usd_base,
    COALESCE(num_transactions_trades, 0) AS num_transactions_trades,
    COALESCE(num_traders_trades, 0) AS num_traders_trades,
    COALESCE(total_amount_usd_trades, 0) AS total_amount_usd_trades
FROM
    base_trades b
FULL OUTER JOIN
    trades t
ON
    b.month = t.month
ORDER BY
    month;
