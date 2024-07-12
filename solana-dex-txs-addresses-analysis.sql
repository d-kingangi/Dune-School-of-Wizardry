SELECT
    DATE_TRUNC('month', block_time) AS month,
    COUNT(DISTINCT tx_id) AS num_transactions,
    COUNT(DISTINCT trader_id) AS num_traders,
    SUM(amount_usd) AS total_amount_usd
FROM
    dex_solana.trades
GROUP BY
    month
ORDER BY
    month;
