
-- block_date
-- total_amount_usd
-- unique_transactions

SELECT
  block_date,
  SUM(amount_usd) AS total_amount_usd,
  COUNT(DISTINCT tx_hash) AS unique_transactions
FROM
  (
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v2_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_arbitrum.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_polygon.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_base.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_optimism.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_bnb.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v3_celo.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap_v1_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      amount_usd,
      tx_hash
    FROM
      uniswap.trades
  ) AS all_trades
GROUP BY
  block_date
ORDER BY
  block_date;