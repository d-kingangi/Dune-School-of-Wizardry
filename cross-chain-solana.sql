WITH
  trades AS (
    SELECT
      date_trunc('day', block_time) AS trade_date,
      blockchain,
      SUM(amount_usd) AS "Volume",
      COUNT(*) AS "Trades"
    FROM
      dex.trades
    WHERE
      block_time > now() - interval '1' month
    GROUP BY
      1,
      2
    UNION ALL
    SELECT
      date_trunc('day', block_time) AS trade_date,
      blockchain,
      SUM(amount_usd) as "Volume",
      COUNT(*) as "Trades"
    FROM
      dex_solana.trades
    WHERE
      block_time > now() - interval '3' month
    GROUP BY
      1,
      2
  )
SELECT
  *
FROM
  trades
WHERE
  "Volume" > 100000000
ORDER BY
  4 DESC