-- blockchain
-- currency_symbol
-- total_amount_raw

SELECT 
    blockchain,
    currency_symbol,
    SUM(amount_raw / 1e18) AS total_amount_raw
FROM 
    gitcoin.donations
GROUP BY 
    blockchain, currency_symbol;


-- blockchain
-- currency_symbol
-- total_amount_raw

-- ethereum
-- WETH
-- 67.1644325604652
-- ethereum
-- BAL
-- 47.51804664828986
-- ethereum
-- DAI
-- 2345548.0999047025
-- ethereum
-- YAM
-- 100
-- ethereum
-- WBTC
-- 1.03119195e-10
-- ethereum
-- BIT
-- 33.44
-- ethereum
-- UBI
-- 247106.815418209
-- ethereum
-- RLY
-- 68170
-- ethereum
-- NMR
-- 75
-- ethereum
-- BOBA
-- 41.37
-- ethereum
-- BZZ
-- 149.82515000000006
-- ethereum
-- 1INCH
-- 162.82
-- ethereum
-- RAI
-- 424.1
-- ethereum
-- ESD
-- 43.165
-- ethereum
-- POLY
-- 553.47
-- ethereum
-- KIWI
-- 0.000025
-- ethereum
-- SAI
-- 18.45
-- ethereum
-- GLM
-- 1575
-- ethereum
-- CTSI
-- 95.6
-- ethereum
-- USDT
-- 4.4352150264699986e-7
-- ethereum
-- ZKS
-- 452.3725
-- ethereum
-- MASK
-- 281.14926223462953
-- polygon
-- MATIC
-- 214320.00250086235
-- ethereum
-- TUSD
-- 231.898
-- ethereum
-- FUSE
-- 227