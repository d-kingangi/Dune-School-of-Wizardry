SELECT
  COUNT(recipients),
SUM(TRY_CAST(element_at(amounts, 1) AS DOUBLE)) / 1e12
FROM icenetwork_bnb.ICEToken_call_airdropToWallets