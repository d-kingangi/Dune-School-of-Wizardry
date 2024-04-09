

SELECT
  DATE_TRUNC('day', bbb.block_time) AS day,
  'gamma' AS marketplace,
  bbb.tx4_in AS buyer,
  bbb.tx3_in AS seller,
  bbb.val3_out AS amount
FROM
  (
    SELECT
      *
    FROM
      (
        SELECT
          id,
          block_time,
          ELEMENT_AT(input, 0 + 1).script_pub_key.address AS tx1_in,
          ELEMENT_AT(input, 0 + 1).value AS val1_in,
          ELEMENT_AT(input, 1 + 1).script_pub_key.address AS tx2_in,
          ELEMENT_AT(input, 1 + 1).value AS val2_in,
          ELEMENT_AT(input, 2 + 1).script_pub_key.address AS tx3_in,
          ELEMENT_AT(input, 2 + 1).value AS val3_in,
          ELEMENT_AT(input, 3 + 1).script_pub_key.address AS tx4_in,
          ELEMENT_AT(input, 3 + 1).value AS val4_in,
          ELEMENT_AT(output, 0 + 1).script_pub_key.address AS tx1_out,
          ELEMENT_AT(output, 0 + 1).value AS val1_out,
          ELEMENT_AT(output, 1 + 1).script_pub_key.address AS tx2_out,
          ELEMENT_AT(output, 1 + 1).value AS val2_out,
          ELEMENT_AT(output, 2 + 1).script_pub_key.address AS tx3_out,
          ELEMENT_AT(output, 2 + 1).value AS val3_out,
          ELEMENT_AT(output, 3 + 1).script_pub_key.address AS tx4_out,
          ELEMENT_AT(output, 3 + 1).value AS val4_out
        FROM
          bitcoin.transactions
        WHERE
          block_time > CAST('2023-02-01' AS TIMESTAMP)
      ) AS aaa
    WHERE
      tx1_out = tx4_in
      AND tx1_out = tx2_in
      AND tx1_out = tx1_in
  ) AS bbb
WHERE
  bbb.tx4_out = 'bc1qyylrgsxjrmaearjqqradhy8ferh4u0ydw4yuze'
  OR bbb.tx3_out = '19sf3ks2pMmEQT3Gy5iFt3AagcoqKF3mmx'
ORDER BY
  day DESC;


