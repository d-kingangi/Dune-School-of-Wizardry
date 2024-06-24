-- tables
-- aerodrome_base.trades
-- aerodrome.trades

-- resulting columns 

-- transaction_date
-- token_bought_symbo
-- transactions_count
-- tx_to_count
-- total_token_bought_amount
-- total_amount_usd

SELECT
  transaction_date,
  token_bought_symbol,
  transactions_count,
  tx_to_count,
  total_token_bought_amount,
  total_amount_usd
FROM
  (
    SELECT
      transaction_date,
      token_bought_symbol,
      transactions_count,
      tx_to_count,
      total_token_bought_amount,
      total_amount_usd,
      ROW_NUMBER() OVER (
        PARTITION BY
          transaction_date
        ORDER BY
          total_amount_usd DESC
      ) AS rn
    FROM
      (
        SELECT
          transaction_date,
          token_bought_symbol,
          COUNT(DISTINCT tx_hash) AS transactions_count,
          COUNT(DISTINCT tx_to) AS tx_to_count,
          SUM(token_bought_amount) AS total_token_bought_amount,
          SUM(amount_usd) AS total_amount_usd
        FROM
          (
            SELECT
              block_date AS transaction_date,
              token_bought_symbol,
              tx_hash,
              tx_to,
              token_bought_amount,
              amount_usd
            FROM
              aerodrome_base.trades
            UNION ALL
            SELECT
              block_date AS transaction_date,
              token_bought_symbol,
              tx_hash,
              tx_to,
              token_bought_amount,
              amount_usd
            FROM
              aerodrome.trades
          ) AS filtered_trades
        GROUP BY
          transaction_date,
          token_bought_symbol
      ) AS daily_stats
  ) AS ranked_stats
WHERE
  rn <= 5
ORDER BY
  transaction_date,
  total_amount_usd DESC;


  2023-08-29 00:00
WETH
260
6
98.86858884323213
165874.50964442323
2023-08-29 00:00
USDbC
213
6
107475.164358
107571.4278148159
2023-08-29 00:00
DOG
82
2
98463819.351919
46603.15142243157
2023-08-29 00:00
WELL
30
2
1168729.202687616
6138.976812946043
2023-08-29 00:00
67
5
2891.8118162034143
2023-08-30 00:00
USDbC
599
13
1093545.560673998
1093639.3495939225
2023-08-30 00:00
WETH
770
23
592.8525854514337
1011092.0757170591
2023-08-30 00:00
wUSDR
119
5
265391.525096728
289448.84502543864
2023-08-30 00:00
271
5
157652.09313035107
2023-08-30 00:00
TAROT
124
3
840882.3834501125
114654.58171925209
2023-08-31 00:00
USDbC
13824
72
17546013.512280073
17557363.633633357
2023-08-31 00:00
WETH
10748
79
6009.419948992138
10185361.740550224
2023-08-31 00:00
AERO
4362
20
11740654.8796978
4501396.248647366
2023-08-31 00:00
wUSDR
776
11
2660284.9213286536
2881218.3342155516
2023-08-31 00:00
7612
20
1300909.4121421597
2023-09-01 00:00
USDbC
7587
60
8152011.591460042
8159424.389984073
2023-09-01 00:00
WETH
5040
71
1914.32168013275
3126826.8401523293
2023-09-01 00:00
wUSDR
482
11
2369527.836340215
2559026.253157598
2023-09-01 00:00
AERO
972
14
3462680.629425903
1044281.8274943331
2023-09-01 00:00
DOLA
36
4
613787.453938801
617001.5564244678
2023-09-02 00:00
USDbC
6102
53
4475997.3119659955
4476802.561542913
2023-09-02 00:00
WETH
3749
68
1807.8748730586162
2952239.3102190346
2023-09-02 00:00
AERO
804
13
5192648.985517116
893631.0713522887
2023-09-02 00:00
wUSDR
233
10
609945.75110995
655761.126279348
2023-09-02 00:00
cbETH
78
6
278.4647058869149
476493.56316611444