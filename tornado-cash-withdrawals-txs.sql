-- tornado vash withdrawals txs 

WITH blockchain AS (
    SELECT distinct bc_name AS filter
    FROM (
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L1s', 'Ethereum') THEN 'ethereum' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L1s', 'BNB') THEN 'bnb' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L1s', 'Gnosis') THEN 'gnosis' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L1s', 'Avalanche') THEN 'avalanche_c' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L2s', 'Optimism') THEN 'optimism' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L2s', 'Arbitrum') THEN 'arbitrum' END AS bc_name
        UNION
        SELECT CASE WHEN '{{Blockchains}}' IN ('All', 'Only L2s', 'Polygon') THEN 'polygon' END AS bc_name
        )
        WHERE bc_name IS NOT NULL
    )

, tokens AS (
    SELECT distinct token_symbol AS filter
    FROM (
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Native EVM Assets',  'ETH') THEN 'ETH' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Native EVM Assets',  'BNB') THEN 'BNB' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Native EVM Assets',  'AVAX') THEN 'AVAX' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Native EVM Assets', 'xDAI, DAI & cDAI',  'xDAI') THEN 'xDAI' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Native EVM Assets',  'MATIC') THEN 'MATIC' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Stablecoins', 'xDAI, DAI & cDAI', 'DAI') THEN 'DAI' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Stablecoins', 'USDC & cUSDC', 'USDC') THEN 'USDC' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'Stablecoins', 'USDT') THEN 'USDT' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'cTokens', 'xDAI, DAI & cDAI', 'cDAI') THEN 'cDAI' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'cTokens', 'USDC & cUSDC', 'cUSDC') THEN 'cUSDC' END AS token_symbol
        UNION
        SELECT CASE WHEN '{{Tokens}}' IN ('All', 'WBTC') THEN 'WBTC' END AS token_symbol
        )
        WHERE token_symbol IS NOT NULL
    )

SELECT date_trunc('week', block_time) AS time
, COUNT(*) AS withdrawals
FROM tornado_cash.withdrawals
WHERE blockchain IN (SELECT filter FROM blockchain)
AND currency_symbol IN (SELECT filter FROM tokens)
AND block_time < date_trunc('week', NOW())
GROUP BY 1