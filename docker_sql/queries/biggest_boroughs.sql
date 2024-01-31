select t2.borough, sum(total_amount) from green_taxi_trips t1
left join location_data t2 
on t1."PULocationID"=t2.locationid
where lpep_pickup_datetime::date='2019-09-18'
and t2.borough!='Unknown'
group by t2.borough 