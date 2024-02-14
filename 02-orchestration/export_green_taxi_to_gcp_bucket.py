import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/dev-keys.json"

bucket_name = 'opozden-dez-hw-bucket'
project_id = 'airy-galaxy-412921'


@data_exporter
def export_data(data, *args, **kwargs):
    table = pa.Table.from_pandas(data)
    gcs = pa.fs.GcsFileSystem()
    date = '2020_01'
    file_path = f'{bucket_name}/gree_taxi_{date}.parquet'
    with gcs_filesystem.open_output_stream(file_path) as file:
        pq.write_table(table, file)
