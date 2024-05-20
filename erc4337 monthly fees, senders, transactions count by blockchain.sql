-- blockchain
-- block_month
-- total_tx_fee_usd
-- monthly_sender_count
-- monthly_transaction_count


SELECT
  blockchain,
  block_month,
  SUM(tx_fee_usd) AS total_tx_fee_usd,
  COUNT(DISTINCT sender) AS monthly_sender_count,
  COUNT(DISTINCT tx_hash) AS monthly_transaction_count
FROM
  (
    SELECT
      *
    FROM
      account_abstraction_erc4337_base.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_ethereum.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_polygon.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_optimism.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_arbitrum.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_gnosis.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_bnb.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_avalanche_c.userops
    UNION ALL
    SELECT
      *
    FROM
      account_abstraction_erc4337_celo.userops
  ) AS unified_userops
GROUP BY
  blockchain,
  block_month
ORDER BY
  blockchain,
  block_month;


  arbitrum
2023-03-01
42.318519688644656
28
116
arbitrum
2023-04-01
280.0177910653505
92
464
arbitrum
2023-05-01
845.854837644336
83
948
arbitrum
2023-06-01
1277.6055053968134
236
2211
arbitrum
2023-07-01
3637.284917486454
1062
5566
arbitrum
2023-08-01
104930.27578871294
213125
218778
arbitrum
2023-09-01
11533.248505552265
15292
33383
arbitrum
2023-10-01
12966.408995038037
3209
28230
arbitrum
2023-11-01
34016.97785931135
2312
34177
arbitrum
2023-12-01
117181.21132877063
20101
111782
arbitrum
2024-01-01
45695.30246928683
7051
60477
arbitrum
2024-02-01
51321.223401131974
8378
47525
arbitrum
2024-03-01
51351.29287956
5915
54976
arbitrum
2024-04-01
7641.560312797279
7186
95034
arbitrum
2024-05-01
4141.141284184152
37742
135008
avalanche_c
2023-03-01
2.358664100765
3
39
avalanche_c
2023-04-01
76.4790878125549
11
185
avalanche_c
2023-05-01
55.23506939989507
12
283
avalanche_c
2023-06-01
59.97185456313079
9
275
avalanche_c
2023-07-01
115.10551904564193
57
353
avalanche_c
2023-08-01
6549.320241595142
2326
53641
avalanche_c
2023-09-01
14016.029907111693
2788
157635
avalanche_c
2023-10-01
8722.450211750227
1812
97148
avalanche_c
2023-11-01
13565.664623767881
1514
62109
avalanche_c
2023-12-01
26300.217504489894
1494
33293