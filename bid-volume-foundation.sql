--query to find bid volume for NFTs in Foundation

SELECT count(*) AS number_of_bids_placed,
       sum(value)/1e18 AS total_bid_volume_in_eth,
       count(DISTINCT ethereum.transactions.from) AS unique_bidders
FROM ethereum.transactions
WHERE ethereum.transactions.to = '0xcda72070e455bb31c7690a170224ce43623d0b6f' --bid contract on Ethereum
  AND ethereum.transactions.value>0
  AND success=true