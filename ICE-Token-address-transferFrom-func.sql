SELECT
  COUNT(DISTINCT "from") AS address_from,
  COUNT(DISTINCT "to") AS address_to
FROM icenetwork_bnb.ICEToken_call_transferFrom