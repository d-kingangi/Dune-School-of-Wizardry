--   year
-- month
-- nominationpools_id
-- unique_validators
-- distinct_blocks

SELECT
  year,
  month,
  nominationpools_id,
  COUNT(DISTINCT address_ss58) AS unique_validators,
  COUNT(DISTINCT block_number) AS distinct_blocks
FROM kusama.stakings
GROUP BY
  year,
  month,
  nominationpools_id
ORDER BY
  year,
  month,
  nominationpools_id



2020
3
887
56
2020
4
1119
123
2020
5
1403
124
2020
6
1992
120
2020
7
2549
124
2020
8
3376
124
2020
9
3616
120
2020
10
3690
124
2020
11
3979
120
2020
12
4238
124
2021
1
4809
124
2021
2
5520
112
2021
3
6172
124
2021
4
6828
120
2021
5
7466
124
2021
6
7880
120
2021
7
8251
124
2021
8
8841
124
2021
9
8800
120
2021
10
8832
124
2021
11
8697
120
2021
12
8526
124
2022
1
8730
124
2022
2
8909
112
2022
3
8912
124