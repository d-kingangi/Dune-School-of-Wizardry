-- blockchain
-- block_date
-- total_daily_amount_usd
-- total_daily_transactions

SELECT
  blockchain,
  block_date,
  SUM(amount_usd) AS total_daily_amount_usd,
  COUNT(DISTINCT tx_hash) AS total_daily_transactions
FROM
  (
    SELECT
      blockchain,
      block_date,
      amount_usd,
      tx_hash
    FROM
      bebop.trades
    UNION ALL
    SELECT
      blockchain,
      block_date,
      amount_usd,
      tx_hash
    FROM
      bebop_arbitrum.trades
    UNION ALL
    SELECT
      blockchain,
      block_date,
      amount_usd,
      tx_hash
    FROM
      bebop_ethereum.trades
    UNION ALL
    SELECT
      blockchain,
      block_date,
      amount_usd,
      tx_hash
    FROM
      bebop_polygon.trades
    UNION ALL
    SELECT
      blockchain,
      block_date,
      amount_usd,
      tx_hash
    FROM
      bebop_bnb.trades
  ) AS all_trades
GROUP BY
  blockchain,
  block_date
ORDER BY
  blockchain,
  block_date;