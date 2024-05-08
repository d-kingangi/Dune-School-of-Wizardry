


WITH project_count AS (
    SELECT 'OpenSea' AS Marketplace, COUNT(DISTINCT project) AS Unique_Projects, COUNT(DISTINCT collection) AS Unique_Collections, SUM(number_of_items) AS Total_Items
    FROM opensea.trades
    UNION ALL
    SELECT 'Magic Eden', COUNT(DISTINCT project), COUNT(DISTINCT collection), SUM(number_of_items)
    FROM magiceden.trades
    UNION ALL
    SELECT 'Rarible', COUNT(DISTINCT project), COUNT(DISTINCT collection), SUM(number_of_items)
    FROM rarible.trades
    UNION ALL
    SELECT 'SuperRare', COUNT(DISTINCT project), COUNT(DISTINCT collection), SUM(number_of_items)
    FROM superrare.trades
    UNION ALL
    SELECT 'Foundation', COUNT(DISTINCT project), COUNT(DISTINCT collection), SUM(number_of_items)
    FROM foundation.trades
)
SELECT Marketplace, Unique_Projects, Unique_Collections, Total_Items
FROM project_count


Marketplace

Unique_Projects

Unique_Collections

Total_Items
Foundation
1
31227
403358
Magic Eden
1
970
1800000000004921921019
OpenSea
1
61693
4602763155212743651292576389
Rarible
1
290
1583836064556849311
SuperRare
1
1399
44931