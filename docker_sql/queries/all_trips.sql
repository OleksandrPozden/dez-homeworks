select count(*) from green_taxi_trips
where lpep_pickup_datetime::date ='2019-09-18' and lpep_dropoff_datetime::date='2019-09-18'