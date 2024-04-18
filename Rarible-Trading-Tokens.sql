-- find the Tokens/Currency used to trade on the Rarible MarketPlace
-- currency_symbol
-- currency_contract
-- total_amount_usd

SELECT
    currency_symbol,
    currency_contract,
    SUM(amount_usd) AS total_amount_usd
FROM
    rarible.trades
GROUP BY
    currency_symbol,
    currency_contract
ORDER BY
    total_amount_usd DESC
LIMIT 10;

-- currency_symbol
-- currency_contract
-- total_amount_usd

-- WMATIC
-- 0x0d500b1d8e8ef31e21c99d1db9a6444d3adf1270
-- 6192563.986894332
-- WETH
-- 0x7ceb23fd6bc0add59e62ac25578270cff1b9f619
-- 860404.4781810746
-- USDC
-- 0x2791bca1f2de4661ed88a30c99a7a9449aa84174
-- 7332.570272008925
-- DOGA
-- 0x2f3e306d9f02ee8e8850f9040404918d0b345207
-- MONA
-- 0x6968105460f67c3bf751be7c15f92f5286fd0ce5
-- 0x400072e8a35fe026a11cfcdf4f58422cdf7dc182
