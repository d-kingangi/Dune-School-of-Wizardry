--foundation nft marketplace
--compare total_amount_usd, total_royalty_fee_amount_raw, total_royalty_fee_amount,
--total_royalty_fee_amount_usd, total_royalty_fee_percentage, total_number_of_items
--for collection on marketplace

SELECT
  collection,
  SUM(amount_usd) AS total_amount_usd,
  SUM(royalty_fee_amount_raw) AS total_royalty_fee_amount_raw,
  SUM(royalty_fee_amount) AS total_royalty_fee_amount,
  SUM(royalty_fee_amount_usd) AS total_royalty_fee_amount_usd,
  SUM(royalty_fee_percentage) AS total_royalty_fee_percentage,
  SUM(number_of_items) AS total_number_of_items
FROM
  nft.trades
GROUP BY
  collection;