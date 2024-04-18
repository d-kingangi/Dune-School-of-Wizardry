-- findi stats on the top earning collection sold on Rarible
-- collection
-- total_amount_usd
-- total_platform_fee_usd
-- average_platform_fee_percentage
-- total_royalty_fee_raw
-- total_royalty_fee
-- total_royalty_fee_usd
-- average_royalty_fee_percentage


SELECT
    collection,
    SUM(amount_usd) AS total_amount_usd,
    SUM(platform_fee_amount_usd) AS total_platform_fee_usd,
    AVG(platform_fee_percentage) AS average_platform_fee_percentage,
    SUM(royalty_fee_amount_raw) AS total_royalty_fee_raw,
    SUM(royalty_fee_amount) AS total_royalty_fee,
    SUM(royalty_fee_amount_usd) AS total_royalty_fee_usd,
    AVG(royalty_fee_percentage) AS average_royalty_fee_percentage
FROM
    rarible.trades
GROUP BY
    collection
ORDER BY
    total_amount_usd DESC
LIMIT 20;


-- collection
-- total_amount_usd
-- total_platform_fee_usd
-- average_platform_fee_percentage
-- total_royalty_fee_raw
-- total_royalty_fee
-- total_royalty_fee_usd
-- average_royalty_fee_percentage

-- Apes In Summer Uniques
-- 375.2544065
-- 9.152546500000001
-- 2
-- 0
-- 0
-- 0
-- 0
-- Baudet vs Schwab
-- 1636.38734255
-- 38.36221255
-- 1.6923076923076923
-- 0
-- 0
-- 0
-- 0
-- CoinCollect NFTs
-- 437.67569365860004
-- 294.25131990860007
-- 59.5
-- 0
-- 0
-- 0
-- 0
-- Collab.Land Genesis Membership NFT
-- 1235.574316575
-- 22.026229074999996
-- 0.625
-- 0
-- 0
-- 0
-- 0
-- CryptoSharks
-- 2532.3343580000005
-- 264.21326930000004
-- 10.918367346938776
-- 0
-- 0
-- 0
-- 0
-- Flash NFTs
-- 4506.96037
-- 89.24674
-- 1
-- 0
-- 0
-- 0
-- 0
-- FLIPPED REAL APE
-- 1837.8215254032152
-- 44.36094762361502
-- 1.9093655589123868
-- 0
-- 0
-- 0
-- 0
-- Hemeta NFT
-- 635.3388953149998
-- 15.444100314999996
-- 1.9805825242718447
-- 0
-- 0
-- 0
-- 0
-- ICE Spartan
-- 409.3567875
-- 8.106075
-- 1
-- 0
-- 0
-- 0
-- 0
-- Jaguar Social Club
-- 1329.4508171875
-- 32.4256296875
-- 2
-- 0
-- 0
-- 0
-- 0
-- Lens Protocol Profiles
-- 5292.093399997552
-- 106.83600820007035
-- 1.4285714285714286
-- 0
-- 0
-- 0
-- 0
-- MASKED APE SQUAD
-- 1568.5780000000013
-- 38.25799999999998
-- 2
-- 0
-- 0
-- 0
-- 0
-- 6995858.101020343
-- 721922.1185472207
-- 6.029216190322611
-- 9063628766422211751348
-- 9063.62876642219
-- 13896.47576741192
-- 2.2671099686020812
-- Polka Fantasy Land
-- 551.490805
-- 6.988390000000001
-- 0.6666666666666666
-- 0
-- 0
-- 0
-- 0
-- PolkaFantasy
-- 9496.2502598
-- 152.76272160000002
-- 0.7142857142857143
-- 0
-- 0
-- 0
-- 0
-- PolkaFantasy Game
-- 8803.2544855
-- 125.079297
-- 0.8571428571428571
-- 0
-- 0
-- 0
-- 0
-- PolygonApes
-- 3599.1395116599997
-- 44.72692876000001
-- 0.38636363636363635
-- 0
-- 0
-- 0
-- 0
-- PolygonPunks
-- 425.11361289999996
-- 8.545022099999999
-- 1.8
-- 0
-- 0
-- 0
-- 0
-- Sandboxs LANDs
-- 11676.3912885
-- 252.715077
-- 1.3636363636363635
-- 0
-- 0
-- 0
-- 0
-- ZED Horse
-- 750.5491847473457
-- 17.682350513325385
-- 1.8651685393258426
-- 950487500000000000
-- 0.9504875
-- 1.265824725
-- 0.11235955056179775
