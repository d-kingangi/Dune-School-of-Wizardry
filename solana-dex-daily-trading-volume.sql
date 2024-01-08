SELECT
  date_trunc('day', block_time) AS trade_date,
   AVG(fee_usd) AS "Average Fee",
   SUM(fee_usd) AS "Total Fees",
   SUM(amount_usd) as "Volume",
   COUNT(*) as "Trades"
FROM
  dex_solana.trades
WHERE
  block_time > now() - interval '3' month
GROUP BY
  1
ORDER BY
  trade_date;
