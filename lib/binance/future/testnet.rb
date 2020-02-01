# frozen_string_literal: true

module Binance
  class Client
    base_uri 'https://testnet.binancefuture.com'
  end
end

require 'binance/future/testnet/market'
require 'binance/future/testnet/account'
require 'binance/future/testnet/order'
