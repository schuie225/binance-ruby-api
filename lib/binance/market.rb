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
    end
  end
end
