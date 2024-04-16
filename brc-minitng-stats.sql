WITH
  DECODES AS (
    SELECT
      output_value,
      FROM_UTF8(
        FROM_HEX(
          SUBSTR(
            CAST(t.hex AS VARCHAR),
            POSITION(
              '2270223a20226272632d323022' IN CAST(t.hex AS VARCHAR)
            ),
            POSITION('7d6821' IN CAST(t.hex AS VARCHAR)) - POSITION(
              '2270223a20226272632d323022' IN CAST(t.hex AS VARCHAR)
            )
          )
        )
      ) AS test,
      t.block_time AS mint_time,
      t.block_height,
      t.size,
      t.virtual_size,
      t.fee * 1e8 AS fee,
      t.fee * 1e8 / t.virtual_size AS sat_byte,
      t.output[1].script_pub_key.address AS minter_address,
      t.index,
      t.id AS tx_id,
      FROM_UTF8(
        FROM_HEX(
          REGEXP_EXTRACT(
            CAST(hex AS VARCHAR),
            '7b2(?:[^7]|7[^bd])*7d(?=[06])'
          )
        )
      ) AS test4
    FROM
      bitcoin.transactions t
    WHERE
      t.block_height > 767429
      AND CAST(t.hex AS VARCHAR) LIKE '%0063036f726401%'
      AND CAST(t.hex AS VARCHAR) LIKE '%226272632d323022%'
      AND MOD(
        LENGTH(
          REGEXP_EXTRACT(
            CAST(hex AS VARCHAR),
            '7b2(?:[^7]|7[^bd])*7d(?=[06])'
          )
        ),
        2
      ) = 0
  )
SELECT
  DATE_TRUNC('day', mint_time) AS day,
  AVG(sat_byte) AS avg_sat_byte,
  SUM(fee / 1e8) AS total_btc_fee,
  COUNT(*) AS count_mints,
  MIN(mint_time) AS first_mint_time,
  MAX(mint_time) AS last_mint_time
FROM
  DECODES
WHERE
  test4 LIKE '%brc-20%'
GROUP BY
  1
ORDER BY
  1;