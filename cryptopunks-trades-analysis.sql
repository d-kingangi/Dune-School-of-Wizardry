-- trade_date
-- trades_count
-- total_amount_usd
-- total_items_traded

SELECT
  DATE(block_time) AS trade_date,
  COUNT(DISTINCT unique_trade_id) AS trades_count,
  SUM(amount_usd) AS total_amount_usd,
  SUM(number_of_items) AS total_items_traded
FROM cryptopunks_ethereum.trades
GROUP BY
  1
ORDER BY
  trade_date