SELECT
  trade,
  block_date,
  COUNT(*) AS total_trades_per_day,
  SUM(volume_usd) AS total_volume_usd_per_day,
  SUM(fee_usd) AS total_fee_usd_per_day,
  SUM(margin_usd) AS total_margin_usd_per_day,
  AVG(margin_usd) AS avg_margin_usd_per_day,
  SUM(leverage) AS total_leverage_per_day,
  AVG(leverage) AS avg_leverage_per_day,
  SUM(pnl) AS total_pnl_per_day
FROM
  immortalx_celo.perpetual_trades
GROUP BY
  trade,
  block_date