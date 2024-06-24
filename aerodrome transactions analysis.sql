-- tables
-- aerodrome_base.trades
-- aerodrome.trades

-- transaction_date
-- total_transactions_count
-- total_tx_from_count
-- total_tx_to_count
-- total_daily_amount_usd

SELECT
    transaction_date,
    SUM(transactions_count) AS total_transactions_count,
    SUM(tx_from_count) AS total_tx_from_count,
    SUM(tx_to_count) AS total_tx_to_count,
    SUM(total_amount_usd) AS total_daily_amount_usd
FROM (

    SELECT
        block_date AS transaction_date,
        COUNT(DISTINCT tx_hash) AS transactions_count,
        COUNT(DISTINCT tx_from) AS tx_from_count,
        COUNT(DISTINCT tx_to) AS tx_to_count,
        SUM(amount_usd) AS total_amount_usd
    FROM
        aerodrome_base.trades
    GROUP BY
        block_date

    UNION ALL


    SELECT
        block_date AS transaction_date,
        COUNT(DISTINCT tx_hash) AS transactions_count,
        COUNT(DISTINCT tx_from) AS tx_from_count,
        COUNT(DISTINCT tx_to) AS tx_to_count,
        SUM(amount_usd) AS total_amount_usd
    FROM
        aerodrome.trades
    GROUP BY
        block_date
) AS combined_results
GROUP BY
    transaction_date
ORDER BY
    transaction_date;



2023-08-29 00:00
1324
628
24
338744.42439963657
2023-08-30 00:00
3560
1214
56
2899051.1683784807
2023-08-31 00:00
46194
9920
180
42525952.68376829
2023-09-01 00:00
22210
6234
168
17706768.310460508
2023-09-02 00:00
17248
4638
164
10705901.8691809
2023-09-03 00:00
17810
3964
186
5579098.7364638485
2023-09-04 00:00
16776
3852
182
4963282.443184849
2023-09-05 00:00
18058
3742
194
5746762.311600922
2023-09-06 00:00
18568
3574
184
6547799.567907199
2023-09-07 00:00
18962
5208
196
10801145.322470736
2023-09-08 00:00
13332
2994
168
5057989.201767795
2023-09-09 00:00
11374
2392
156
3599537.7337396787
2023-09-10 00:00
13700
2764
168
4629739.303481132
2023-09-11 00:00
11756
2700
178
5694120.759947516
2023-09-12 00:00
10254
2812
162
4257811.700262571
2023-09-13 00:00
9936
2710
168
3431614.3260286143
2023-09-14 00:00
12306
4216
166
5803314.177169148
2023-09-15 00:00
13836
3144
154
4839438.733521702
2023-09-16 00:00
10152
2344
146
2886306.4893350736
2023-09-17 00:00
12024
2676
158
4484323.379397854
2023-09-18 00:00
11916
2812
158
6767686.011839595
2023-09-19 00:00
8824
2628
154
2677159.85199885
2023-09-20 00:00
7446
2426
160
2756594.0766616883
2023-09-21 00:00
9422
4036
190
3773732.9367299313
2023-09-22 00:00
7458
2946
146
1834019.2872898884