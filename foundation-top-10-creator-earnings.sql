--query to find earnings of the top 25 creators in ETH

SELECT seller AS artist,
       round(sum(("ownerRev"+"creatorFee") / 1e18)::numeric, 2) AS earnings_eth
FROM foundation."market_evt_ReserveAuctionFinalized"
GROUP BY artist
ORDER BY earnings_eth DESC
LIMIT 25