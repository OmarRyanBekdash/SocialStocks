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
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={}&interval=5min&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            last_refreshed = data["Meta Data"]["3. Last Refreshed"]
            return json.dumps({"success": True, "data": data["Time Series (5min)"][last_refreshed]})
        return json.dumps({"success": False, "error": data["Error Message"]})

