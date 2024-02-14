import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    date = kwargs["execution_date"].strftime("%Y-%m")
    url = f"https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_{date}.parquet"
    response = requests.get(url)
    response.raise_for_status()
    file_content = io.BytesIO(response.content)
    df = pd.read_parquet(file_content)
    return df
    
@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
