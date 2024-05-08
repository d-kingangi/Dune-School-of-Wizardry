-- Marketplace

-- block_date

-- Total_Amount_USD

-- Total_Items_Sold

-- Unique_Sellers

-- Unique_Buyers

-- Unique_Transactions

-- Unique_Trades

WITH daily_stats AS (
    SELECT 'OpenSea' AS Marketplace, block_date,
           SUM(amount_usd) AS Total_Amount_USD,
           SUM(number_of_items) AS Total_Items_Sold,
           COUNT(DISTINCT seller) AS Unique_Sellers,
           COUNT(DISTINCT buyer) AS Unique_Buyers,
           COUNT(DISTINCT tx_hash) AS Unique_Transactions,
           COUNT(DISTINCT unique_trade_id) AS Unique_Trades
    FROM opensea.trades
    GROUP BY block_date
    UNION ALL
    SELECT 'Magic Eden', block_date,
           SUM(amount_usd), 
           SUM(number_of_items),
           COUNT(DISTINCT seller),
           COUNT(DISTINCT buyer),
           COUNT(DISTINCT tx_hash),
           COUNT(DISTINCT unique_trade_id)
    FROM magiceden.trades
    GROUP BY block_date
    UNION ALL
    SELECT 'Rarible', block_date,
           SUM(amount_usd), 
           SUM(number_of_items),
           COUNT(DISTINCT seller),
           COUNT(DISTINCT buyer),
           COUNT(DISTINCT tx_hash),
           COUNT(DISTINCT unique_trade_id)
    FROM rarible.trades
    GROUP BY block_date
    UNION ALL
    SELECT 'SuperRare', block_date,
           SUM(amount_usd), 
           SUM(number_of_items),
           COUNT(DISTINCT seller),
           COUNT(DISTINCT buyer),
           COUNT(DISTINCT tx_hash),
           COUNT(DISTINCT unique_trade_id)
    FROM superrare.trades
    GROUP BY block_date
    UNION ALL
    SELECT 'Foundation', block_date,
           SUM(amount_usd), 
           SUM(number_of_items),
           COUNT(DISTINCT seller),
           COUNT(DISTINCT buyer),
           COUNT(DISTINCT tx_hash),
           COUNT(DISTINCT unique_trade_id)
    FROM foundation.trades
    GROUP BY block_date
)
SELECT Marketplace, block_date, 
       Total_Amount_USD,
       Total_Items_Sold,
       Unique_Sellers,
       Unique_Buyers,
       Unique_Transactions,
       Unique_Trades
FROM daily_stats
ORDER BY block_date, Marketplace


