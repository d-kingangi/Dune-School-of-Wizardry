-- event_date
-- total_transactions
-- unique_beneficiaries
-- unique_sent_to

WITH AllEvents AS (
  SELECT
    DATE(evt_block_time) AS event_date,
    'Deposited' AS event_type,
    beneficiary,
    depositor AS sentTo
  FROM valora_celo.WalletJumpstart_evt_ERC20Deposited
  UNION ALL
  SELECT
    DATE(evt_block_time) AS event_date,
    'Claimed' AS event_type,
    beneficiary,
    TRY_CAST(NULL AS VARBINARY) AS sentTo
  FROM valora_celo.WalletJumpstart_evt_ERC20Claimed
  UNION ALL
  SELECT
    DATE(evt_block_time) AS event_date,
    'Reclaimed' AS event_type,
    beneficiary,
    sentTo
  FROM valora_celo.WalletJumpstart_evt_ERC20Reclaimed
)
SELECT
  event_date,
  COUNT(*) AS total_transactions,
  COUNT(DISTINCT beneficiary) AS unique_beneficiaries,
  COUNT(DISTINCT sentTo) AS unique_sent_to
FROM AllEvents
GROUP BY
  event_date
ORDER BY
  event_date

-- event_date
-- total_transactions
-- unique_beneficiaries
-- unique_sent_to
2024-03-27
2
1
1
2024-03-28
13
7
1
2024-03-29
8
4
1
2024-04-03
17
9
1
2024-04-04
29
17
5
2024-04-05
21
12
4
2024-04-10
1
1
1
2024-04-11
10
5
2
2024-04-12
2
1
1
2024-04-14
4
2
1
2024-04-15
40
21
10
2024-04-16
38
20
15
2024-04-17
76
52
17
2024-04-18
132
78
47
2024-04-19
63
41
26
2024-04-20
14
8
8
2024-04-21
16
10
9
2024-04-22
25
14
10
2024-04-23
23
15
14
2024-04-24
9
7
6
2024-04-25
22
14
10
2024-04-26
14
7
6
2024-04-27
12
7
6
2024-04-28
16
9
8
2024-04-29
12
7
7
