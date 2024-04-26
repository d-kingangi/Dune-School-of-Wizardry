-- Error: Query execution timed out after 2 minutes [Execution ID: 01HWCK6KKWK44A5RDETK3BRRD1].
-- Error: Query execution timed out after 2 minutes [Execution ID: 01HWCK6KKWK44A5RDETK3BRRD1].
-- Error: Query execution timed out after 2 minutes [Execution ID: 01HWCK6KKWK44A5RDETK3BRRD1].
-- Error: Query execution timed out after 2 minutes [Execution ID: 01HWCK6KKWK44A5RDETK3BRRD1].




WITH unique_addresses AS (
  SELECT
    "from" AS address
  FROM zkevm.transactions
  UNION
  SELECT
    "to"
  FROM zkevm.transactions
)
SELECT
  ua.address,
  COUNT(t.hash) AS transaction_count,
  SUM(TRY_CAST(t.gas_used AS DECIMAL) / 1e18) AS total_gas_used,
  SUM(TRY_CAST(t.value AS DECIMAL) / 1e18) AS total_value
FROM unique_addresses AS ua
LEFT JOIN zkevm.transactions AS t
  ON ua.address = t."from" OR ua.address = t."to"
GROUP BY
  ua.address