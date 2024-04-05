WITH CollectionItems AS (
    SELECT
        collection,
        COUNT(*) AS items_count,
        SUM(amount_usd) AS total_amount_received
    FROM
        magiceden.trades
    GROUP BY
        collection
)
SELECT
    collection,
    items_count,
    total_amount_received
FROM
    CollectionItems
ORDER BY
    items_count DESC
LIMIT 40;  --set limit for project collection items


-- items_count
-- total_amount_received
-- collection

-- 675395419
-- 9273340.222905293
-- Okay Dog Artifacts
-- 3283
-- 1027411.3843381997
-- ZED Horse
-- 481
-- 1032.9723415456851
-- Planet Mojo: War Banners
-- 437
-- 54288.60432518997
-- Okay Dogs
-- 428
-- 113214.36141140002
-- Uniswap V3 Positions NFT-V1
-- 358
-- 136.55963104859998
-- cometh spaceships
-- 236
-- 30546.531182889994
-- Battle Derby Pass
-- 163
-- 75613.26778268162
-- y00ts
-- 147
-- 322931.64441903436
-- PolygonPunks
-- 143
-- 15692.304695330004
-- Neon District Season One Item
-- 132
-- 10.378479766640002
-- Otherside Mara
-- 112
-- 46983.05202099998
-- Aavegotchi
-- 109
-- 38080.42812070001
-- The Kimoji
-- 103
-- 933.0086259999999
-- Otherdeed Expanded
-- 102
-- 76576.0912787753
-- Clashub VIP PASS
-- 85
-- 4967.490223455
-- Crazy Bears
-- 81
-- 3127.5409102
-- a KID called BEAST
-- 72
-- 49574.52948886947
-- 7007 Genesis Pass
-- 60
-- 3770.344516053001
-- BillionaireZombiesClub
-- 59
-- 3200.005096201
-- Otherside Koda
-- 51
-- 356895.2612302001
-- 10KTF G Tags
-- 51
-- 40310.494657
-- Sunflower Land
-- 48
-- 129.49831481249998
-- Otherside Vessels
-- 47
-- 14921.859108
-- League of Kingdoms ITEM
-- 45
-- 14.4586592936