with daily_weather as (
    SELECT
    DATE(TIME) AS DATE,
    MAIN AS WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS
    FROM 
    {{ source('demo_source', 'WEATHERTABLE') }}
),
 daily_weather_agg as (
    select 
    dateadd(year, 5, date) as date, 
    weather,
    round(avg(temp),2) as temp,
    cast(round(avg(pressure)) as int) as pressue,
    cast(round(avg(humidity)) as int) as humidity,
    cast(round(avg(clouds)) as int) as clouds
    from 
    daily_weather
    group by date, weather
    qualify row_number() over (partition by date order by count(weather) desc) = 1
 )


SELECT * FROM daily_weather_agg order by date desc 