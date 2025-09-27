with CTE as (
    select 
    t.*,
    w.*
    from 
    ({{ref('trip_fact') }}) t
    left join
    ({{ref('daily_weather')}}) w
    on t.trip_start_date = w.date
)

select * from CTE 