--compare the transction fees across the major layer2 networks
--Celo, Polygon, optimism, arbitrum, base
---weekly average


SELECT
  'Base' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  AVG(TRY_CAST(gas_price AS DECIMAL) * TRY_CAST(gas_used AS DECIMAL)) AS avg_gas_fee_base,
  0 AS avg_gas_fee_polygon,
  0 AS avg_gas_fee_arbitrum,
  0 AS avg_gas_fee_optimism
FROM base.transactions
GROUP BY
  2
UNION ALL
SELECT
  'Polygon' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  0 AS avg_gas_fee_base,
  AVG(TRY_CAST(gas_price AS DECIMAL) * TRY_CAST(gas_used AS DECIMAL)) AS avg_gas_fee_polygon,
  0 AS avg_gas_fee_arbitrum,
  0 AS avg_gas_fee_optimism
FROM polygon.transactions
GROUP BY
  2
UNION ALL
SELECT
  'Arbitrum' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  0 AS avg_gas_fee_base,
  0 AS avg_gas_fee_polygon,
  AVG(TRY_CAST(gas_price AS DECIMAL) * TRY_CAST(gas_used AS DECIMAL)) AS avg_gas_fee_arbitrum,
  0 AS avg_gas_fee_optimism
FROM arbitrum.transactions
GROUP BY
  2
UNION ALL
SELECT
  'Optimism' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  0 AS avg_gas_fee_base,
  0 AS avg_gas_fee_polygon,
  0 AS avg_gas_fee_arbitrum,
  AVG(TRY_CAST(gas_price AS DECIMAL) * TRY_CAST(gas_used AS DECIMAL)) AS avg_gas_fee_optimism
FROM optimism.transactions
GROUP BY
  2
ORDER BY
  week_start,
  network