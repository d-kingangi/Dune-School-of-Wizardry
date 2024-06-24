
-- union table for 
-- platypus_finance.trades
-- platypus_finance_avalanche_c.trades
--avalance blockchain


SELECT
  pf.tx_hash,
  pf.project AS project_pf,
  pf.token_bought_symbol AS token_bought_symbol_pf,
  pf.token_sold_symbol AS token_sold_symbol_pf,
  pf.token_bought_amount AS token_bought_amount_pf,
  pf.token_sold_amount AS token_sold_amount_pf,
  pf.amount_usd AS amount_usd_pf,
  pf.block_date AS block_date_pf,
  pf.block_time AS block_time_pf,
  pfac.project AS project_pfac,
  pfac.token_bought_symbol AS token_bought_symbol_pfac,
  pfac.token_sold_symbol AS token_sold_symbol_pfac,
  pfac.token_bought_amount AS token_bought_amount_pfac,
  pfac.token_sold_amount AS token_sold_amount_pfac,
  pfac.amount_usd AS amount_usd_pfac,
  pfac.block_date AS block_date_pfac,
  pfac.block_time AS block_time_pfac
FROM
  platypus_finance.trades AS pf
  JOIN platypus_finance_avalanche_c.trades AS pfac ON pf.tx_hash = pfac.tx_hash;


--result columns

-- tx_hash
-- project_pf
-- token_bought_symbol_pf
-- token_sold_symbol_pf
-- token_bought_amount_pf
-- token_sold_amount_pf
-- amount_usd_pf
-- block_date_pf
-- block_time_pf
-- project_pfac
-- token_bought_symbol_pfac
-- token_sold_symbol_pfac
-- token_bought_amount_pfac
-- token_sold_amount_pfac
-- amount_usd_pfac
-- block_date_pfac
-- block_time_pfac