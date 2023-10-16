/* query to sum non-vote and vote transactions per hour for the last 30 days */


SELECT
  hour,
  SUM(non_vote_transactions) AS non_vote_transactions,
  SUM(vote_transactions) AS vote_transactions
FROM (
  (
    SELECT
      DATE_TRUNC('hour', block_time) AS hour,
      0 AS non_vote_transactions,
      COUNT(id) AS vote_transactions
    FROM solana.vote_transactions
    WHERE
      block_time > (
        CURRENT_TIMESTAMP - INTERVAL '30' day
      )
    GROUP BY
      1
  )
  UNION ALL
  (
    SELECT
      DATE_TRUNC('hour', block_time) AS hour,
      COUNT(id) AS non_vote_transactions,
      0 AS vote_transactions
    FROM solana.transactions
    WHERE
      block_time > (
        CURRENT_TIMESTAMP - INTERVAL '30' day
      )
    GROUP BY
      1
  )
)
GROUP BY
  1