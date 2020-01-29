require 'json'
require 'httparty'
require 'binance/version'
require 'binance/authentication'
require 'binance/error'
require 'binance/client'


module Binance
  class Client
    base_uri 'https://api.binance.com'
  end
end

require 'binance/spot/system'
require 'binance/spot/market'
