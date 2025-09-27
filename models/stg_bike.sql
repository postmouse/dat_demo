with bike as (
    select 
    *
    from 
    {{ source('demo_source', 'BIKE_TABLE') }}
    where ride_id != 'ride_id'
)

select * from bike