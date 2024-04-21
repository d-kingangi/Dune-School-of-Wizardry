-- week_start
-- transactions_per_week
-- cumulative_transactions


WITH weekly_transactions AS (
  SELECT
    block_time,
    DATE_TRUNC('week', block_time) AS week_start
  FROM 
    celo.transactions
),

weekly_counts AS (
  SELECT
    week_start,
    COUNT(*) AS transactions_per_week
  FROM 
    weekly_transactions
  GROUP BY
    week_start
),

cumulative_counts AS (
  SELECT
    a.week_start,
    SUM(b.transactions_per_week) AS cumulative_transactions
  FROM 
    weekly_counts a
  JOIN 
    weekly_counts b ON a.week_start >= b.week_start
  GROUP BY
    a.week_start
)


SELECT
  cumulative_counts.week_start,
  weekly_counts.transactions_per_week,
  cumulative_counts.cumulative_transactions
FROM
  weekly_counts
JOIN
  cumulative_counts ON weekly_counts.week_start = cumulative_counts.week_start
ORDER BY
  cumulative_counts.week_start;



-- week_start
-- transactions_per_week
-- cumulative_transactions

2020-04-20 00:00
5071
5071
2020-04-27 00:00
1977
7048
2020-05-04 00:00
418
7466
2020-05-11 00:00
1214
8680
2020-05-18 00:00
1948
10628
2020-05-25 00:00
1181
11809
2020-06-01 00:00
539
12348
2020-06-08 00:00
4866
17214
2020-06-15 00:00
26797
44011
2020-06-22 00:00
28225
72236
2020-06-29 00:00
34664
106900
2020-07-06 00:00
37329
144229
2020-07-13 00:00
34317
178546
2020-07-20 00:00
32344
210890
2020-07-27 00:00
38764
249654
2020-08-03 00:00
47368
297022
2020-08-10 00:00
65317
362339
2020-08-17 00:00
39131
401470
2020-08-24 00:00
50997
452467
2020-08-31 00:00
53547
506014
2020-09-07 00:00
38252
544266
2020-09-14 00:00
85879
630145
2020-09-21 00:00
79511
709656
2020-09-28 00:00
95102
804758
2020-10-05 00:00
76936
881694