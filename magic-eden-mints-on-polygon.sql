SELECT
  DATE_TRUNC('month', block_time) AS month,
  SUM(number_of_items) AS NFT_minted,
  ROUND(SUM(amount_original), 2) AS POL_raised,
  ROUND(SUM(amount_usd), 2) AS USD_raised
FROM
  nft.mints
WHERE
  evt_type = 'Mint'
  AND blockchain = 'polygon'
GROUP BY
  1
ORDER BY
  month DESC