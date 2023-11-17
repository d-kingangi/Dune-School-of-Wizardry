--foundation monthly stats 
--i.e USD, nft traded, 
--also find no. of unique addresses

SELECT
  EXTRACT(MONTH FROM block_date) AS month,
  EXTRACT(YEAR FROM block_date) AS year,
  COUNT(*) AS total_nfts_sold,
  COUNT(DISTINCT seller) + COUNT(DISTINCT buyer) AS total_unique_addresses,
  SUM(amount_usd) AS total_sales_amount_usd,
  SUM(platform_fee_amount_usd) AS total_platform_fee_amount_usd
FROM nft.trades
WHERE
  EXTRACT(YEAR FROM block_date) >= 2020 --specify start time
GROUP BY
  2,
  1
ORDER BY
  year,
  month

