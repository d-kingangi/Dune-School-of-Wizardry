--query to find total ETH stored in Gnosis Safe weekly

WITH
  per_week AS (
    SELECT
      DATE_TRUNC('week', block_time) AS week,
      SUM(CAST(amount_raw AS DOUBLE)) AS amount_raw
    FROM safe_ethereum.eth_transfers
    GROUP BY 1
  ),
  accumulated AS (
    SELECT
      week,
      SUM(CAST(amount_raw AS DOUBLE)) OVER (
        ORDER BY week rows BETWEEN unbounded preceding
        AND CURRENT ROW
      ) AS eth_balance_raw
    FROM per_week
  )
SELECT
  week,
  eth_balance_raw / 1e18 AS eth_balance
FROM accumulated