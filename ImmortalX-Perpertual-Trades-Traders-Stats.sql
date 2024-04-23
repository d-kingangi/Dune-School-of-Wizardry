WITH trader_stats AS (
    SELECT
        trader,
        SUM(volume_usd) AS total_volume_usd,   
        SUM(fee_usd) AS total_fee_usd,         
        AVG(leverage) AS avg_leverage,         
        AVG(margin_usd) AS avg_margin_usd,    
        SUM(volume_raw) / 1e18 AS total_volume_raw 
    FROM
        immortalx_celo.perpetual_trades
    GROUP BY
        trader                                 
)

SELECT
    trader,
    total_volume_usd,
    total_fee_usd,
    avg_leverage,
    avg_margin_usd,
    total_volume_raw
FROM
    trader_stats
ORDER BY
    total_volume_usd DESC                     
LIMIT
    30                                      
