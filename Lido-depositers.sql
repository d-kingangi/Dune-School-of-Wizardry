--query to find total unique depositors to Lido 

select count(distinct sender) distinct_sender, 
       count(distinct evt_tx_hash) distinct_hash 
from lido_ethereum.steth_evt_Submitted
