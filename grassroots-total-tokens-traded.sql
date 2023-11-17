--Grassroots on Celo
--TokenUniqueSymbolIndex contract
--total unique tokens traded

SELECT
COUNT(_token) as Tokens
FROM grassroots_celo.TokenUniqueSymbolIndex_evt_AddressAdded