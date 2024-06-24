-- tables
-- platypus_finance.trades
-- platypus_finance_avalanche_c.trades



SELECT
  transaction_date,
  COUNT(tx_hash) AS num_transactions,
  COUNT(DISTINCT tx_from) AS num_unique_tx_from,
  COUNT(DISTINCT tx_to) AS num_unique_tx_to,
  SUM(amount_usd) AS daily_amount_usd
FROM
  (
    SELECT
      DATE(block_date) AS transaction_date,
      tx_hash,
      tx_from,
      tx_to,
      amount_usd
    FROM
      platypus_finance.trades
    WHERE
      block_date >= CURRENT_DATE
    UNION ALL
    SELECT
      DATE(block_date) AS transaction_date,
      tx_hash,
      tx_from,
      tx_to,
      amount_usd
    FROM
      platypus_finance_avalanche_c.trades
    WHERE
      block_date >= CURRENT_DATE
  ) AS combined_results
GROUP BY
  transaction_date
ORDER BY
  transaction_date DESC;