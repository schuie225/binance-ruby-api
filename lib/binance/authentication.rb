module Binance
  class Authentication
    class << self
      def public_api_key
        ENV['BINANCE_PUBLIC_API_KEY']
      end
    end
  end
end