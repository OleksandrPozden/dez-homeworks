select t3.zone, max(tip_amount) from green_taxi_trips t1
left join location_data t2 
on t1."PULocationID"=t2.locationid
left join location_data t3
on t1."DOLocationID"=t3.locationid
where lpep_pickup_datetime >= '2019-09-01 00:00:00'
  AND lpep_pickup_datetime < '2019-10-01 00:00:00'
and t2.zone='Astoria'
group by t3.zone
