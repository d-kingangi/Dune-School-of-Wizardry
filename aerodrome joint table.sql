-- union tables 
-- aerodrome_base.trades
-- aerodrome.trades


SELECT
  *
FROM
  aerodrome_base.trades AS base
  JOIN aerodrome.trades AS regular ON base.blockchain = regular.blockchain
  AND base.project = regular.project
  AND base.version = regular.version
  AND base.block_date = regular.block_date
  AND base.block_month = regular.block_month
  AND base.block_time = regular.block_time
  AND base.token_bought_symbol = regular.token_bought_symbol
  AND base.token_sold_symbol = regular.token_sold_symbol
  AND base.token_pair = regular.token_pair
  AND base.token_bought_amount = regular.token_bought_amount
  AND base.token_sold_amount = regular.token_sold_amount
  AND base.token_bought_amount_raw = regular.token_bought_amount_raw
  AND base.token_sold_amount_raw = regular.token_sold_amount_raw
  AND base.amount_usd = regular.amount_usd
  AND base.token_bought_address = regular.token_bought_address
  AND base.token_sold_address = regular.token_sold_address
  AND base.taker = regular.taker
  AND base.maker = regular.maker
  AND base.project_contract_address = regular.project_contract_address
  AND base.tx_hash = regular.tx_hash
  AND base.tx_from = regular.tx_from
  AND base.tx_to = regular.tx_to
  AND base.evt_index = regular.evt_index;