--find the value of all artwork on Superare
--value in USD
--Superrare: nft marketplace

WITH sales AS
  (SELECT nft_contract_address,
          token_id,
          max(block_time) AS block_time
   FROM nft.trades
   WHERE project = 'superrare'
   GROUP BY 1,
            2)
SELECT sum(amount_usd)
FROM nft.trades nft
INNER JOIN sales ON nft.nft_contract_address = sales.nft_contract_address
AND nft.token_id = sales.token_id
AND nft.block_time = sales.block_time
AND project = 'superrare'