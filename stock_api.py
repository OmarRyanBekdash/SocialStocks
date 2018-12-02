"""
Maxim Baduk
AlphaVantage api key: 4QJ82DOI81UB69RQ
"""

import json
import requests

apikey = '4QJ82DOI81UB69RQ'

# An instance sends requests to AlphaVantage to get stock data
class StockGetter():

    def demo(self):
        data = requests.get('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=demo')
        return json.dumps(data.json())

    def get_current_price(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={}&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        return json.dumps(data["Time Series (Daily)"]["2018-11-28"])

