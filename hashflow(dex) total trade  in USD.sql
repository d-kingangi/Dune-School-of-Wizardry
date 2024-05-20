-- total_amount_usd_traded
-- 12973998105.42389

SELECT SUM(amount_usd) AS total_amount_usd_traded
FROM (
    SELECT amount_usd FROM hashflow.trades
    UNION ALL
    SELECT amount_usd FROM hashflow_ethereum.trades
    UNION ALL
    SELECT amount_usd FROM hashflow_bnb.trades
    UNION ALL
    SELECT amount_usd FROM hashflow_optimism.trades
    UNION ALL
    SELECT amount_usd FROM hashflow_avalanche_c.trades
    UNION ALL
    SELECT amount_usd FROM hashflow.cross_chain_trades
    UNION ALL
    SELECT amount_usd FROM hashflow_ethereum.crosschain_trades
    UNION ALL
    SELECT amount_usd FROM hashflow_bnb.crosschain_trades
    UNION ALL
    SELECT amount_usd FROM hashflow_optimism.crosschain_trades
    UNION ALL
    SELECT amount_usd FROM hashflow_avalanche_c.crosschain_trades
) AS all_trades;

