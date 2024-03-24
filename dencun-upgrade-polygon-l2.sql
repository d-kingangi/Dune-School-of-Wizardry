WITH
  polygon AS (
    SELECT
      DATE_TRUNC('day', block_time) AS date_time,
      CASE
        WHEN block_time < DATE(TRY_CAST('2024-03-14' AS TIMESTAMP)) THEN 'Before'
        ELSE 'After'
      END AS period,
      COUNT(DISTINCT hash) AS txs,
      COUNT(DISTINCT "from") AS total_active_users,
      SUM(
        (
          TRY_CAST(gas_used AS DOUBLE) * TRY_CAST(gas_price AS DOUBLE)
        ) / 1e18
      ) AS all_tx_fee
    FROM
      polygon.transactions
    WHERE
      DATE(block_time) >= DATE(TRY_CAST('2023-07-10' AS TIMESTAMP))
    GROUP BY
      1,
      2
  ),
  new_users AS (
    SELECT
      birth_date,
      COUNT(DISTINCT "from") AS total_new_users
    FROM
      (
        SELECT
          "from",
          MIN(DATE(block_time)) AS birth_date
        FROM
          polygon.transactions
        GROUP BY
          "from"
      )
    GROUP BY
      birth_date
  )
SELECT
  p.date_time,
  p.period,
  p.txs,
  p.all_tx_fee,
  p.total_active_users,
  n.total_new_users,
  p.total_active_users - n.total_new_users AS returning_users,
  SUM(n.total_new_users) OVER (
    ORDER BY
      p.date_time
  ) AS cumulative_new_users
FROM
  polygon AS p
  LEFT JOIN new_users AS n ON n.birth_date = p.date_time
ORDER BY
  p.date_time DESC