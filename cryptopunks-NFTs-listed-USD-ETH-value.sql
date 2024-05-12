-- total_nfts_listed 7112
-- total_eth_amount 2821394278.381013
-- total_usd_amount 2821394278.381013
-- total_nft_holders 7018

SELECT
  COUNT(DISTINCT ct.token_id) AS total_nfts_listed,
  SUM(ct.amount_usd) AS total_eth_amount, 
  SUM(ct.amount_usd) AS total_usd_amount,
  COUNT(DISTINCT ct.buyer) AS total_nft_holders 
FROM cryptopunks.trades AS ct

