--analyse the Kusama Transfer Table

--year
-- month
-- day
-- daily_transfers_count
-- total_raw_amount
-- total_amount

SELECT 
    year, 
    month, 
    day, 
    COUNT(*) AS daily_transfers_count,
    SUM(raw_amount) AS total_raw_amount,
    SUM(amount) AS total_amount
FROM 
    kusama.transfers
GROUP BY 
    year, 
    month, 
    day
ORDER BY 
    year, 
    month, 
    day


--     year

-- month

-- day

-- daily_transfers_count

-- total_raw_amount

-- total_amount
2019
11
29
918
4078016515378091652.000000000
4078016.5153780887
2019
12
1
91
12724555724934332.000000000
12724.555724934327
2019
12
2
2
2000000000000
2
2019
12
4
83
206240164000000000.000000000
206240.16400000008
2019
12
5
416
61091886402869012.000000000
61091.88640286896
2019
12
6
290
55155581141824099.000000000
55155.5811418241
2019
12
7
500
85505992784092616.000000000
85505.99278409271
2019
12
8
303
15768304200000000.000000000
15768.304200000033
2019
12
9
507
244442501697834133.000000000
244442.50169783444
2019
12
10
740
241651320045900183.000000000
241651.3200459006
2019
12
11
306
43027038747312350.000000000
43027.03874731223
2019
12
12
498
96991369782903125.000000000
96991.36978290313
2019
12
13
637
32500110598003000.000000000
32500.110598003102
2019
12
14
367
37228399975000000.000000000
37228.39997499988
2019
12
15
354
112465282503000000.000000000
112465.28250299935
2019
12
16
302
46525738935990000.000000000
46525.738935989975
2019
12
17
197
26339285659095571.000000000
26339.285659095553
2019
12
18
203
130815505174037036.000000000
130815.50517403713
2019
12
19
323
1079407383997774810.000000000
1079407.3839977756
2019
12
20
205
82779127033340000.000000000
82779.12703333997
2019
12
21
110
7958773643000000
7958.773643000013
2019
12
22
87
62106064332000000.000000000
62106.06433199995
2019
12
23
257
50980624810000000.000000000
50980.624809999834
2019
12
24
153
66342079800000000.000000000
66342.07980000011
2019
12
25
115
23494179568070000.000000000
23494.179568069998