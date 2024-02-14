select count(*) from zoomcamp.green_taxi_2022;


CREATE OR REPLACE TABLE `zoomcamp.green_taxi_2022_internal` AS
SELECT * FROM zoomcamp.green_taxi_2022;

select count(distinct PULocationID) from `zoomcamp.green_taxi_2022_internal`;

select count(distinct PULocationID) from `zoomcamp.green_taxi_2022`;

select count(*) from `zoomcamp.green_taxi_2022`
where fare_amount = 0;

CREATE OR REPLACE TABLE `zoomcamp.green_taxi_2022_partitioned` 
PARTITION BY DATE(lpep_pickup_datetime) 
CLUSTER BY PUlocationID 
AS (
  SELECT * 
  FROM `zoomcamp.green_taxi_2022_internal`
);