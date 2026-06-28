{{ config(materialized='table') }} 

select bet_id
    ,user_id
    ,event_id
    ,stake
    ,potential_payout
    ,odds
    ,bet_type
    ,market
    ,placed_at AT TIME ZONE 'UTC' AT TIME ZONE 'Europe/London' as placed_at
    ,settled_at AT TIME ZONE 'UTC' AT TIME ZONE 'Europe/London' as settled_at
    ,status
    ,cash_out_amount
from {{ source('raw_data', 'bets') }}