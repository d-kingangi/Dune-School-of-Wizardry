--find daily users of the $degen bridge on Base network

SELECT
  DATE
    (evt_block_time) 
  AS 
  date,
  COUNT
    (DISTINCT "from") 
    AS 
    bridgers
FROM 
erc20_base.evt_Transfer
WHERE
  to = 0x43019F8BE1F192587883b67dEA2994999f5a2de2
  AND evt_block_time >= CURRENT_DATE - INTERVAL '14' day
GROUP BY
  DATE(evt_block_time)
ORDER BY
  DATE(evt_block_time)

--date
--bridgers

2024-03-20
1
2024-03-21
1
2024-03-22
2
2024-03-23
1
2024-03-24
1
2024-03-25
1
2024-03-26
1
2024-03-27
10
2024-03-28
488
2024-03-29
5094
2024-03-30
7117
2024-03-31
7075
2024-04-01
3816
2024-04-02
2505
2024-04-03
572