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

    # Note: a better function is get_quote()
    def get_current_price(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={}&interval=5min&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            last_refreshed = data["Meta Data"]["3. Last Refreshed"]
            return json.dumps({"success": True, "data": data["Time Series (5min)"][last_refreshed]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def get_intraday_prices(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={}&interval=5min&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            return json.dumps({"success": True, "data": data["Time Series (5min)"]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def get_daily_prices(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={}&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            last_refreshed = data["Meta Data"]["3. Last Refreshed"]
            return json.dumps({"success": True, "data": data["Time Series (Daily)"][last_refreshed]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def get_weekly_prices(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol={}&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            return json.dumps({"success": True, "data": data["Weekly Time Series"]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def get_monthly_prices(self, symbol):
        url = 'https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol={}&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            return json.dumps({"success": True, "data": data["Monthly Time Series"]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def get_quote(self, symbol):
        url = 'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol={}&apikey={}'.format(symbol, apikey)
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            return json.dumps({"success": True, "data": data["Global Quote"]})
        return json.dumps({"success": False, "error": data["Error Message"]})

    def match_companies(self, search):
        url = 'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords={}&apikey={}'.format(search, apikey)    
        data = requests.get(url).json()
        if data.get("Error Message") is None:
            return json.dumps({"success": True, "data": data["bestMatches"]})
        return json.dumps({"success": False, "error": data["Error Message"]})