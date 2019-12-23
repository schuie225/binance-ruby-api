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
    end
  end
end