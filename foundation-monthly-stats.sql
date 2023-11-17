--foundation monthly stats 
--i.e USD, nft traded, 

SELECT
  EXTRACT(MONTH FROM block_date) AS month,
  EXTRACT(YEAR FROM block_date) AS year,
  COUNT(*) AS total_nfts_sold,
  SUM(amount_usd) AS total_sales_amount_usd,
  SUM(platform_fee_amount_usd) AS total_platform_fee_amount_usd
FROM nft.trades
WHERE
  EXTRACT(YEAR FROM block_date) >= 2020
GROUP BY
  2,
  1
ORDER BY
  year,
  month