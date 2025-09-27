WITH bike AS (
    SELECT 
      ride_id,
      date(to_timestamp(started_at)) as trip_start_date,
      rideable_type,
      start_statio_id as start_station_id,
      end_station_id as end_station_id,
      member_csual as member_casual,
      timestampdiff(second, to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration
    FROM {{ref('stg_bike')}}
)
SELECT * FROM bike order by trip_start_date desc