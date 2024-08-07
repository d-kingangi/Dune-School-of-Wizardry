
-- time
-- users
-- new_users
-- existing_users
-- total_users

SELECT
  DATE_TRUNC('day', block_time) AS time,
  COUNT(DISTINCT address) AS users,
  SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END) AS new_users,
  COUNT(DISTINCT address) - SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END) AS existing_users,
  SUM(SUM(CASE WHEN row_num = 1 THEN 1 ELSE 0 END)) OVER (ORDER BY DATE_TRUNC('day', block_time)) AS total_users
FROM (
  SELECT
    block_time,
    address,
    ROW_NUMBER() OVER (PARTITION BY address ORDER BY block_time) AS row_num
  FROM (
    SELECT
      block_time,
      "from" AS address
    FROM sepolia.transactions
    UNION ALL
    SELECT
      block_time,
      "to" AS address
    FROM sepolia.transactions
  ) AS transfers
)
WHERE
  block_time >= CURRENT_DATE - INTERVAL '1' year
GROUP BY
  1



  2023-06-19 00:00
54088
14444
39644
14444
2023-06-20 00:00
69319
26463
42856
40907
2023-06-21 00:00
52489
12228
40261
53135
2023-06-22 00:00
62736
9598
53138
62733
2023-06-23 00:00
64546
10553
53993
73286
2023-06-24 00:00
43184
9775
33409
83061
2023-06-25 00:00
68022
17459
50563
100520
2023-06-26 00:00
65635
14472
51163
114992
2023-06-27 00:00
74132
16745
57387
131737
2023-06-28 00:00
77519
15521
61998
147258
2023-06-29 00:00
76108
18015
58093
165273
2023-06-30 00:00
66098
14715
51383
179988
2023-07-01 00:00
61113
15923
45190
195911
2023-07-02 00:00
58028
14842
43186
210753
2023-07-03 00:00
74875
13158
61717
223911
2023-07-04 00:00
55037
10925
44112
234836
2023-07-05 00:00
59652
7808
51844
242644
2023-07-06 00:00
140688
9505
131183
252149
2023-07-07 00:00
53435
9303
44132
261452
2023-07-08 00:00
46319
6747
39572
268199
2023-07-09 00:00
56093
7647
48446
275846
2023-07-10 00:00
59971
10935
49036
286781
2023-07-11 00:00
76940
10695
66245
297476
2023-07-12 00:00
67999
12693
55306
310169
2023-07-13 00:00
68155
11981
56174
322150