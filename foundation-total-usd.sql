--foundation nft marketplace
--total amount_usd, royalty_fee_amount_usd, platform_fee_amount_usd

SELECT
  SUM(amount_usd) AS total_amount_usd,
  SUM(royalty_fee_amount_usd) AS total_royalty_fee_amount_usd,
  SUM(platform_fee_amount_usd) AS total_platform_fee_amount_usd
FROM
  nft.trades;
