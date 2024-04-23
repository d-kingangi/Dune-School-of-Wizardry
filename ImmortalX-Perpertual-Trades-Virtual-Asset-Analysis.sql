SELECT
    virtual_asset,                    
    SUM(volume_usd) AS total_volume_usd,  
    COUNT(DISTINCT trader) AS unique_traders,  
    COUNT(DISTINCT tx_from) AS unique_tx_from, 
    SUM(pnl) AS total_pnl                 
FROM
    immortalx_celo.perpetual_trades
GROUP BY
    virtual_asset                          -- Group by virtual asset
