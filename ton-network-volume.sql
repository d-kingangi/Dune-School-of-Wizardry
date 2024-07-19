SELECT
  DATE_TRUNC('day', block_time) AS day,
  SUM(amount_usd) AS Daily_vol,
  SUM(SUM(amount_usd)) OVER (ORDER BY DATE_TRUNC('day', block_time)) AS Total_Vol
FROM dex.trades
WHERE
  block_time >= TRY_CAST('2023-12-01' AS TIMESTAMP)
  AND project_contract_address IN (0x819a26d0c6f3af2b9fe4e9c4bcac04fcb3ea7f2a, 0xea403e36fb592fdfdc342c38e94284ddbb0d2105, 0x923dd5668a0f373b714f8d230425ed7799c5d63d, 0xd6f0ba7ec72ff3974b02c18ed1fc33da77434d41,0x4b62fa30fea125e43780dc425c2be5acb4ba743b, 0x6a9c4fc2b35ee398e7a0e75d982872466ba93cb8,0x5f0d8fc6057a959e79f7f79f8dbf12f29f9a9f34, 0x36652fdf0b2a16ea8ec7616db29008648424980f)
GROUP BY
  1
ORDER BY
  1 DESC