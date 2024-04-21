

-- Final query to get daily averages in both their original units and converted to USD 
WITH daily_prices AS (
  SELECT
    DATE_TRUNC('day', minute) AS date,
    AVG(price) AS avg_usd_price
  FROM prices.usd
  WHERE
    symbol = 'CELO'
  GROUP BY
    1
), daily_averages AS (
  SELECT
    DATE_TRUNC('day', block_time) AS date,
    AVG(TRY_CAST(gas_limit AS DOUBLE)) AS avg_gas_limit,
    AVG(TRY_CAST(gas_price AS DOUBLE)) AS avg_gas_price,
    AVG(TRY_CAST(gas_used AS DOUBLE)) AS avg_gas_used
  FROM celo.transactions
  GROUP BY
    1
)
SELECT
  d.date,
  d.avg_gas_limit AS original_avg_gas_limit,
  d.avg_gas_price AS original_avg_gas_price,
  d.avg_gas_used AS original_avg_gas_used,
  d.avg_gas_limit * p.avg_usd_price AS avg_gas_limit_in_usd,
  d.avg_gas_price * p.avg_usd_price AS avg_gas_price_in_usd,
  d.avg_gas_used * p.avg_usd_price AS avg_gas_used_in_usd
FROM daily_averages AS d
LEFT JOIN daily_prices AS p
  ON d.date = p.date
ORDER BY
  d.date