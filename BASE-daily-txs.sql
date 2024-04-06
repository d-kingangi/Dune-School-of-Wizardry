--finding daily transactions on the BASE l2 blockchain

WITH
  transactions AS (
    SELECT
      DATE_TRUNC('day', block_time) AS time_,
      COUNT(*) AS txns
    FROM
      base.transactions
    GROUP BY
      1
    ORDER BY
      1 DESC
  )
SELECT
  time_,
  txns,
  ROUND(
    AVG(txns) OVER (
      ORDER BY
        time_ ROWS BETWEEN 6 PRECEDING
        AND CURRENT ROW
    )
  ) AS "7d avg"
FROM
  transactions
WHERE
  time_ > DATE '2023-07-12';  -- base launch date