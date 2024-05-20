-- block_date
-- blockchain
-- daily_volume_usd
-- daily_transaction_count

SELECT 
    block_date,
    blockchain,
    SUM(amount_usd) AS daily_volume_usd,
    COUNT(DISTINCT tx_hash) AS daily_transaction_count
FROM 
    (
        SELECT * FROM openocean_optimism.trades
        UNION ALL
        SELECT * FROM openocean.trades
        UNION ALL
        SELECT * FROM openocean_v2_fantom.trades
        UNION ALL
        SELECT * FROM openocean_v2_avalanche_c.trades
    ) AS combined_trades
GROUP BY 
    block_date, 
    blockchain
ORDER BY 
    block_date DESC,
    blockchain;


2024-05-16
avalanche_c
68574.00375024453
71
2024-05-16
fantom
114961.89992973443
235
2024-05-16
optimism
51288.68212004898
89
2024-05-15
avalanche_c
347496.9849510179
386
2024-05-15
fantom
122893.42121540557
501
2024-05-15
optimism
204399.61861464332
324
2024-05-14
avalanche_c
249797.92019398467
375
2024-05-14
fantom
78180.00931800812
256
2024-05-14
optimism
220959.52087167843
291
2024-05-13
avalanche_c
177120.1606570192
358
2024-05-13
fantom
85995.20971369206
300
2024-05-13
optimism
305279.1125109618
281
2024-05-12
avalanche_c
116774.77430687689
326
2024-05-12
fantom
50325.42020788535
217
2024-05-12
optimism
187741.90993338055
230
2024-05-11
avalanche_c
91807.3797469931
402
2024-05-11
fantom
59260.10541483372
302
2024-05-11
optimism
470220.0189186472
297
2024-05-10
avalanche_c
379264.5895647007
2338
2024-05-10
fantom
296316.66913447244
333
2024-05-10
optimism
100377.47521272814
397
2024-05-09
avalanche_c
180082.17534365773
2395
2024-05-09
fantom
1320010.2299941378
748
2024-05-09
optimism
240475.42325201165
388
2024-05-08
avalanche_c
146582.09429951935
327