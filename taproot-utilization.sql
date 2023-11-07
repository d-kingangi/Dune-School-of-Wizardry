SELECT date_trunc('month', block_time) AS time,
         cast(COUNT(CASE WHEN type = 'witness_v1_taproot' THEN 1 END) AS double)/count(*) AS taproot_share
    FROM bitcoin.outputs
   WHERE block_height > 1000000 --specify block number
GROUP BY 1
