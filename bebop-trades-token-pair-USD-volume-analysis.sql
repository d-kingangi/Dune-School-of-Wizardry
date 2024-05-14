-- token_pair
-- block_date
-- total_daily_amount_usd
-- total_daily_transactions


WITH ranked_pairs AS (
  SELECT
    token_pair,
    block_date,
    SUM(amount_usd) AS total_amount_usd,
    tx_hash,
    ROW_NUMBER() OVER (PARTITION BY block_date ORDER BY SUM(amount_usd) DESC) AS pair_rank
  FROM (
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM bebop.trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM bebop_arbitrum.trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM bebop_ethereum.trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM bebop_polygon.trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM bebop_bnb.trades
  ) AS all_trades
  GROUP BY
    token_pair,
    block_date,
    tx_hash
)
SELECT
  token_pair,
  block_date,
  SUM(total_amount_usd) AS total_daily_amount_usd,
  COUNT(DISTINCT tx_hash) AS total_daily_transactions
FROM ranked_pairs
WHERE
  pair_rank <= 4
GROUP BY
  token_pair,
  block_date
ORDER BY
  token_pair,
  block_date