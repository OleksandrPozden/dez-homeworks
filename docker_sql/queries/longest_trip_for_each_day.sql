with trips as (
	select lpep_pickup_datetime::date, lpep_dropoff_datetime::date, trip_distance from green_taxi_trips
	where (lpep_pickup_datetime::date ='2019-09-18' and lpep_dropoff_datetime::date='2019-09-18')
		or (lpep_pickup_datetime::date ='2019-09-26' and lpep_dropoff_datetime::date='2019-09-26')
		or (lpep_pickup_datetime::date ='2019-09-16' and lpep_dropoff_datetime::date='2019-09-16')
		or (lpep_pickup_datetime::date ='2019-09-21' and lpep_dropoff_datetime::date='2019-09-21')
)
select lpep_pickup_datetime, max(trip_distance)
from trips
group by lpep_pickup_datetime
