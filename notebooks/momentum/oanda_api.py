from pyoanda import Client, SANDBOX, PRACTICE, TRADE
from datetime import datetime, timedelta
import pandas as pd
import itertools
import os.path
import os


TIME_FORMAT = "%Y-%m-%dT%H:%M:%S.%fZ"


def get_latest_history(client, instrument, granularity, num_bars, **kwargs):

    data = pd.DataFrame()

    end_date = (datetime.utcnow() + timedelta(days=4)).strftime(TIME_FORMAT)
    
    if granularity in ["W"]:
        batch_size = 2000
    elif granularity in ["M"]:
        batch_size = 500
    else:
        5000

    while len(data) < num_bars and len(data) % 5000 == 0:
        print("fetching data, data so far: {}".format(len(data)))

        response = client.get_instrument_history(
            instrument,
            candle_format="bidask",
            granularity=granularity,
            count=batch_size,
      #      start=None,
     #       end=end_date,
            **kwargs
        )

        df = pd.DataFrame(response['candles'])
        end_date = df.time[0]

        data = data.append(df)

    data = data.drop_duplicates().sort_values('time')
    # data = data[data.complete]
    # del data['complete']
    data.set_index('time', inplace=True)
    data.columns = [instrument.replace('_', '') + '_' + c for c in data.columns]

    return data



def download_all_history(pair, granularity, num_bars, fname, **kwargs):
    account_id = 8549639
    access_token = "0d44c2b98e9c6f87f89d2a01d0277bb1-dd1d501eb4de808461d3e4c94ff68a1e"
    
    client = Client(PRACTICE, account_id, access_token)

    data = get_latest_history(
        client=client,
        instrument=pair,
        granularity=granularity,
        num_bars=num_bars,
        **kwargs
    )

    data.to_csv(fname)
    
    return data