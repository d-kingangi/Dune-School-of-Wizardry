SELECT
  COUNT(*) AS "Attestations onchain"
FROM
  attestationstation_v1_optimism.SchemaRegistry_call_getSchema
WHERE uid = 0xd7b8c4ffa4c9fd1ecb3f6db8201e916a8d7dba11f161c1b0b5ccf44ceb8e2a39
AND call_success = true