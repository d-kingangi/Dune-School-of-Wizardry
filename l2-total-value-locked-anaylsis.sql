--find the total value locked for the major layer 2 networks
-- Polygon, optimism, arbitrum, base


SELECT
  week_start,
  SUM(TRY_CAST(total_value_locked_base AS DECIMAL)) AS total_value_locked_base,
  SUM(TRY_CAST(total_value_locked_polygon AS DECIMAL)) AS total_value_locked_polygon,
  SUM(TRY_CAST(total_value_locked_arbitrum AS DECIMAL)) AS total_value_locked_arbitrum,
  SUM(TRY_CAST(total_value_locked_optimism AS DECIMAL)) AS total_value_locked_optimism
FROM (
  SELECT
    DATE_TRUNC('week', block_time) AS week_start,
    SUM(TRY_CAST(value AS DECIMAL)) AS total_value_locked_base,
    0 AS total_value_locked_polygon,
    0 AS total_value_locked_arbitrum,
    0 AS total_value_locked_optimism
  FROM base.transactions
  WHERE
    block_time >= TRY_CAST('2023-01-01' AS DATE)
  GROUP BY
    DATE_TRUNC('week', block_time)
  UNION ALL
  SELECT
    DATE_TRUNC('week', block_time) AS week_start,
    0 AS total_value_locked_base,
    SUM(TRY_CAST(value AS DECIMAL)) AS total_value_locked_polygon,
    0 AS total_value_locked_arbitrum,
    0 AS total_value_locked_optimism
  FROM polygon.transactions
  WHERE
    block_time >= TRY_CAST('2023-01-01' AS DATE)
  GROUP BY
    DATE_TRUNC('week', block_time)
  UNION ALL
  SELECT
    DATE_TRUNC('week', block_time) AS week_start,
    0 AS total_value_locked_base,
    0 AS total_value_locked_polygon,
    SUM(TRY_CAST(value AS DECIMAL)) AS total_value_locked_arbitrum,
    0 AS total_value_locked_optimism
  FROM arbitrum.transactions
  WHERE
    block_time >= TRY_CAST('2023-01-01' AS DATE)
  GROUP BY
    DATE_TRUNC('week', block_time)
  UNION ALL
  SELECT
    DATE_TRUNC('week', block_time) AS week_start,
    0 AS total_value_locked_base,
    0 AS total_value_locked_polygon,
    0 AS total_value_locked_arbitrum,
    SUM(TRY_CAST(value AS DECIMAL)) AS total_value_locked_optimism
  FROM optimism.transactions
  WHERE
    block_time >= TRY_CAST('2023-01-01' AS DATE)
  GROUP BY
    DATE_TRUNC('week', block_time)
) AS subquery
GROUP BY
  week_start