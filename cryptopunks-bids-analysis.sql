-- punk_id

-- highest_bidder

-- highest_bid_eth

-- highest_bid_usd

-- listed_price_eth

-- listed_price_usd


SELECT
  cb.punk_id AS punk_id,
  cb.bidder AS highest_bidder,
  cb.bid_amount_eth AS highest_bid_eth,
  cb.bid_amount_current_usd AS highest_bid_usd,
  cl.listed_price_eth AS listed_price_eth,
  cl.listed_price_current_usd AS listed_price_usd
FROM cryptopunks_ethereum.current_bids AS cb
JOIN cryptopunks_ethereum.current_listings AS cl
  ON cb.punk_id = cl.punk_id
LEFT JOIN (
  SELECT
    punk_id,
    MAX(bid_amount_eth) AS max_bid_eth
  FROM cryptopunks_ethereum.current_bids
  GROUP BY
    punk_id
) AS max_bids_eth
  ON cb.punk_id = max_bids_eth.punk_id AND cb.bid_amount_eth = max_bids_eth.max_bid_eth
LEFT JOIN (
  SELECT
    punk_id,
    MAX(bid_amount_current_usd) AS max_bid_usd
  FROM cryptopunks_ethereum.current_bids
  GROUP BY
    punk_id
) AS max_bids_usd
  ON cb.punk_id = max_bids_usd.punk_id
  AND cb.bid_amount_current_usd = max_bids_usd.max_bid_usd