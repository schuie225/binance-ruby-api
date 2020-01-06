module Binance
  class Authentication
    class << self
      def public_api_key
        ENV['BINANCE_PUBLIC_API_KEY']
      end

      def api_private_key
        ENV['BINANCE_PRIVATE_API_KEY']
      end

      def signature(payload)
        digest = OpenSSL::Digest::SHA256.new
        OpenSSL::HMAC.hexdigest(digest, api_private_key, payload)
      end
    end
  end
end
