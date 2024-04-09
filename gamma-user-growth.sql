--showcase the growth of the gamma marketplace by  finding its user growth

SELECT
  DATE_TRUNC('day', block_time) AS day,
  COUNT(DISTINCT tx4_in) AS user_count
FROM (
  SELECT
    id,
    block_time,
    TRY_CAST(ELEMENT_AT(input, 1).script_pub_key.address AS VARCHAR) AS tx1_in,
    TRY_CAST(ELEMENT_AT(input, 2).script_pub_key.address AS VARCHAR) AS tx2_in,
    TRY_CAST(ELEMENT_AT(input, 3).script_pub_key.address AS VARCHAR) AS tx3_in,
    TRY_CAST(ELEMENT_AT(input, 4).script_pub_key.address AS VARCHAR) AS tx4_in
  FROM bitcoin.transactions
  WHERE
    block_time > TRY_CAST('2023-02-01' AS TIMESTAMP)
) AS bbb
WHERE
  tx1_in = tx4_in AND tx1_in = tx2_in AND tx1_in = tx1_in
GROUP BY
  1
ORDER BY
  day