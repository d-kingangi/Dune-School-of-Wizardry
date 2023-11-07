SELECT date_trunc('day', block_time) AS time,
    CAST(COUNT(CASE WHEN type = 'witness_v1_taproot' THEN 1 END) AS double)/count(*) AS taproot
FROM bitcoin.outputs
WHERE block_height > 709632 --transactions starting from block 709632 where Taproot was activated
GROUP BY 1;