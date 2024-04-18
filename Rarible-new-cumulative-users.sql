--find the new users of the Rarible Platform each week and Cumulatively

WITH daily_users AS (
  SELECT DISTINCT
    DATE(block_time) AS transaction_date,
    seller AS user_address
  FROM rarible.trades
  WHERE
    block_date >= CAST('2021-01-01' AS TIMESTAMP) AND block_date <= CURRENT_DATE
)
SELECT
  transaction_week,
  COUNT(DISTINCT user_address) AS weekly_users,
  SUM(COUNT(DISTINCT user_address)) OVER (ORDER BY transaction_week) AS cumulative_users
FROM (
  SELECT
    transaction_date,
    DATE_TRUNC('week', transaction_date) AS transaction_week,
    user_address
  FROM daily_users
) AS weekly_counts
GROUP BY
  transaction_week
ORDER BY
  transaction_week



transaction_week
weekly_users
cumulative_users

2022-02-21
1
1
2022-03-14
19
20
2022-03-21
78
98
2022-03-28
117
215
2022-04-04
114
329
2022-04-11
183
512
2022-04-18
202
714
2022-04-25
252
966
2022-05-02
242
1208
2022-05-09
217
1425
2022-05-16
245
1670
2022-05-23
210
1880
2022-05-30
209
2089
2022-06-06
239
2328
2022-06-13
227
2555
2022-06-20
250
2805
2022-06-27
233
3038
2022-07-04
288
3326
2022-07-11
314
3640
2022-07-18
243
3883
2022-07-25
290
4173
2022-08-01
253
4426
2022-08-08
252
4678
2022-08-15
331
5009
2022-08-22
281
5290