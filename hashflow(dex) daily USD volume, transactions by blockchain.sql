-- block_date
-- blockchain
-- daily_total_amount_usd
-- daily_number_of_transactions

SELECT
  block_date,
  blockchain,
  SUM(daily_total_amount_usd) AS daily_total_amount_usd,
  SUM(daily_number_of_transactions) AS daily_number_of_transactions
FROM (
  SELECT
    block_date,
    blockchain,
    SUM(amount_usd) AS daily_total_amount_usd,
    COUNT(DISTINCT tx_hash) AS daily_number_of_transactions
  FROM (
    SELECT
      block_date,
      'ethereum' AS blockchain,
      amount_usd,
      tx_hash
    FROM hashflow_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      'bnb' AS blockchain,
      amount_usd,
      tx_hash
    FROM hashflow_bnb.trades
    UNION ALL
    SELECT
      block_date,
      'optimism' AS blockchain,
      amount_usd,
      tx_hash
    FROM hashflow_optimism.trades
    UNION ALL
    SELECT
      block_date,
      'avalanche_c' AS blockchain,
      amount_usd,
      tx_hash
    FROM hashflow_avalanche_c.trades
  ) AS trades_data
  GROUP BY
    block_date,
    blockchain
  UNION ALL
  SELECT
    block_date,
    source_chain AS blockchain,
    SUM(amount_usd) AS daily_total_amount_usd,
    COUNT(DISTINCT TRY_CAST(tx_hash AS VARCHAR)) AS daily_number_of_transactions
  FROM (
    SELECT
      block_date,
      source_chain,
      amount_usd,
      TRY_CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM hashflow.cross_chain_trades
    UNION ALL
    SELECT
      block_date,
      source_chain,
      amount_usd,
      TRY_CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM hashflow_ethereum.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      source_chain,
      amount_usd,
      TRY_CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM hashflow_bnb.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      source_chain,
      amount_usd,
      TRY_CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM hashflow_optimism.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      source_chain,
      amount_usd,
      TRY_CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM hashflow_avalanche_c.crosschain_trades
  ) AS crosschain_data
  GROUP BY
    block_date,
    source_chain
) AS combined_data
GROUP BY
  block_date,
  blockchain
ORDER BY
  block_date,
  blockchain