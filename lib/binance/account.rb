# frozen_string_literal: true

module Binance
  class Account
    class << self
      def all_coins
        Client.private_send(:get, '/sapi/v1/capital/config/getall')
      end
    end
  end
end
