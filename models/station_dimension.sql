WITH bike AS (
    SELECT 
      distinct
      start_statio_ID as station_id,
      start_station_name as station_name,
      start_lat as station_lat,
      start_lng as station_lng
    FROM {{source('demo_source','BIKE_TABLE')}}
)
SELECT * FROM bike