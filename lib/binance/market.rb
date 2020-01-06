# frozen_string_literal: true

module Binance
  class Market
    class << self
      def ping
        Client.public_send(path: '/api/v3/ping')
      end

      def server_time
        Client.public_send(path: '/api/v3/time')
      end

      def exchange_info
        Client.public_send(path: '/api/v3/exchangeInfo')
      end

      def orderbook(symbol:, limit: 100)
        Client.public_send(
          path: '/api/v3/depth',
          params: {
            symbol: symbol,
            limit: limit
          }
        )
      end

      def trades(symbol:, limit: 500)
        Client.public_send(
          path: '/api/v3/trades',
          params: {
            symbol: symbol,
            limit: limit
          }
        )
      end

      def historical_trades(symbol:, limit: 500, from_id: nil)
        Client.public_send(
          path: '/api/v3/historicalTrades',
          params: {
            symbol: symbol,
            limit: limit,
            fromId: from_id
          }.compact
        )
      end

      def aggTrades(symbol:, params: {})
        Client.public_send(
          path: '/api/v3/aggTrades',
          params: params.merge(symbol: symbol).compact
        )
      end

      def klines(symbol:, interval:, params: {})
        Client.public_send(
          path: '/api/v3/klines',
          params: params.merge(
            symbol: symbol,
            interval: interval
          ).compact
        )
      end

      def avgPrice(symbol:)
        Client.public_send(
          path: '/api/v3/avgPrice',
          params: {
            symbol: symbol
          }
        )
      end

      def ticker(symbol: nil)
        Client.public_send(
          path: '/api/v3/ticker/24hr',
          params: {
            symbol: symbol
          }.compact
        )
      end

      def ticker_price(symbol: nil)
        Client.public_send(
          path: '/api/v3/ticker/price',
          params: {
            symbol: symbol
          }.compact
        )
      end

      def orderbook_ticker(symbol: nil)
        Client.public_send(
          path: '/api/v3/ticker/bookTicker',
          params: {
            symbol: symbol
          }.compact
        )
      end
    end
  end
end
