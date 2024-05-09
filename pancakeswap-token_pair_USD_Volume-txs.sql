

SELECT
  token_pair,
  block_date,
  SUM(amount_usd) AS total_amount_usd,
  COUNT(DISTINCT tx_hash) AS daily_tx_count
FROM
  (
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v3_bnb.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v3_ethereum.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v3_arbitrum.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v3_base.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v2_bnb.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v2_arbitrum.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v2_ethereum.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap_v2_base.amm_trades
    UNION ALL
    SELECT
      token_pair,
      block_date,
      amount_usd,
      tx_hash
    FROM
      pancakeswap.trades
  ) AS combined_trades
GROUP BY
  token_pair,
  block_date
ORDER BY
  token_pair,
  block_date;
