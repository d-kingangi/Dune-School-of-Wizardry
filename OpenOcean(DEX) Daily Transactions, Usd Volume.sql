-- block_date
-- daily_volume_usd
-- daily_transaction_count


SELECT
  block_date,
  SUM(amount_usd) AS daily_volume_usd,
  COUNT(DISTINCT tx_hash) AS daily_transaction_count
FROM
  (
    SELECT
      *
    FROM
      openocean_optimism.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean_v2_fantom.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean_v2_avalanche_c.trades
  ) AS combined_trades
GROUP BY
  block_date
ORDER BY
  block_date DESC;