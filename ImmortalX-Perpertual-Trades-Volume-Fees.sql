SELECT
  DATE_TRUNC('week', block_date) AS week, 
  SUM(volume_usd) AS total_volume_usd, 
  SUM(fee_usd) AS total_fee_usd, 
  SUM(volume_raw) / 1e18 AS total_volume_raw 
FROM immortalx_celo.perpetual_trades
GROUP BY
  1
ORDER BY
  week 