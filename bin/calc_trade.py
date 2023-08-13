#!/usr/bin/env python3

import sys
from coinmarketcap import Market


symbols = {
    'ETH': 'ethereum',
    'BTC': 'bitcoin',
    'USD': 'usdollar'
}
quantity = float(sys.argv[1])
buy_price = float(sys.argv[2])
sell_price = float(sys.argv[3])
quote_currency = symbols[sys.argv[4]]

total_buy_price = quantity * buy_price
total_sell_price = quantity * sell_price

total_profit = total_sell_price - total_buy_price
pct_change = (sell_price - buy_price)/buy_price

coinmarketcap = Market()
ticker = coinmarketcap.ticker(quote_currency, limit=1, convert='USD')
quote_price = float(ticker[0]['price_usd'])
print(quote_price)
usd_profit = total_profit * quote_price

print("Total %s Profit: %f" % (quote_currency, total_profit))
print("Total USD Profit: $%f" % (usd_profit))
print("Pct Change: ", pct_change * 100, "%")




