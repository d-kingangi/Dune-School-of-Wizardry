--number of users whove bridged tokens through the degen contract address on  base network
-- DEGEN l3 network, first of its kind, that I know off
--$DEGEN

SELECT
  count
  (distinct "from") 
  AS 
  bridgers
FROM
  erc20_base.evt_Transfer  --base evm network
WHERE
  to = 0x43019F8BE1F192587883b67dEA2994999f5a2de2  --degen contrsct address