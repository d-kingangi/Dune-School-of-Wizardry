
WITH address_stats AS (
  SELECT
    address,
    SUM(value_sent) AS total_amount_sent, 
    SUM(value_received) AS total_amount_received,
    SUM(gas_used_sent) AS total_gas_used, 
    SUM(transaction_count_sent) AS total_transactions_sent, 
    SUM(transaction_count_received) AS total_transactions_received 
  FROM (
    SELECT
      "from" AS address,
      value AS value_sent,
      0 AS value_received,
      gas_used AS gas_used_sent,
      1 AS transaction_count_sent,
      0 AS transaction_count_received
    FROM tron.transactions
    UNION ALL
    SELECT
      to AS address,
      0 AS value_sent,
      value AS value_received,
      gas_used AS gas_used_sent,
      0 AS transaction_count_sent,
      1 AS transaction_count_received
    FROM tron.transactions
  ) AS transaction_data
  GROUP BY
    address
)
SELECT
  address,
  total_amount_sent + total_amount_received AS total_volume,
  total_amount_sent,
  total_amount_received,
  total_gas_used,
  total_transactions_sent + total_transactions_received AS total_transactions
FROM address_stats
ORDER BY
  total_volume DESC
LIMIT 10