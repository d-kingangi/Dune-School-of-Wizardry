 --binance's eminent collapse
 SELECT
  DATE_TRUNC('hour', block_time) AS hour,
  SUM(value)/1e18 AS total_outflow
FROM ethereum.transactions
WHERE
  "from" = 0x28c6c06298d514db089934071355e5743bf21d60
  AND block_time >= CURRENT_TIMESTAMP - INTERVAL '7' day
GROUP BY
  1
ORDER BY
  hour