--finding the revenue for BASE l2


WITH
  data AS (
    SELECT
      DATE_TRUNC('day', t.block_time) AS time_,
      SUM(t.gas_used * t.gas_price / 1e18) AS total_gas_fee_eth,
      SUM(t.l1_fee / 1e18) AS total_l1_fee_eth,
      SUM(t.gas_used * t.gas_price / 1e18 * p.price) AS total_gas_fee_usd,
      SUM(t.l1_fee / 1e18 * p.price) AS total_l1_fee_usd,
      ROUND(
        SUM(t.gas_used * t.gas_price / 1e18 * p.price) + SUM(t.l1_fee / 1e18 * p.price)
      ) AS revenue,
      ROUND(SUM(t.gas_used * t.gas_price / 1e18 * p.price)) AS profit
    FROM
      base.transactions AS t
      LEFT JOIN prices.usd AS p ON DATE_TRUNC('minute', t.block_time) = p.minute
      AND p.contract_address = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
    WHERE
      DATE_TRUNC('day', block_time) > TRY_CAST('2023-07-12' AS DATE)
    GROUP BY
      1
    ORDER BY
      1 DESC
  )
SELECT
  time_,
  revenue,
  profit,
  SUM(revenue) OVER (
    ORDER BY
      time_
  ) AS "total revenue",
  SUM(profit) OVER (
    ORDER BY
      time_
  ) AS "total profit"
FROM
  data
GROUP BY
  1,
  2,
  3
LIMIT
  200