#!/usr/bin/env python3

import sys
import ccxt


exchange = sys.argv[1]

quote_currency = sys.argv[2]

exchanges = {
    'BITTREX': ccxt.bittrex()
}


markets = exchanges[exchange].load_markets()

for market, info in markets.items():
    base, quote = market.split("/")
    if quote == quote_currency:
        print(exchange + ":" + base + quote)



