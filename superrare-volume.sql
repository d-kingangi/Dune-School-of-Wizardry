--query to find trade volume on superrare
--superrare: nft marketplace

WITH artists AS
  (SELECT _creator AS artist
   FROM superrare_ethereum.SuperRare_evt_WhitelistCreator
   UNION ALL 
   SELECT _newAddress
   FROM xcopy_ethereum.superrare_asset_v2_evt_AddToWhitelist)

SELECT date_trunc('month', block_time) AS MONTH,
       sum(amount_usd) AS usd
FROM nft.trades
WHERE project = 'superrare'
GROUP BY 1
ORDER BY 1;