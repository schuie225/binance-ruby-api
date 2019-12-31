# frozen_string_literal: true

module Binance
  class Client
    include HTTParty

    base_uri 'https://api.binance.com'

    class << self
      def public_send(path: '/', params: {})
        response = get(path, query: params, headers: build_headers)
        process(response)
      end

      private

      def build_headers
        {
          "Accept": 'application/json',
          "Accept-Charset": 'UTF-8',
          "Content-Type": 'application/json',
          "X-MBX-APIKEY": Authentication.public_api_key
        }
      end

      def payload(method, path, timestamp, params)
        method = method.upcase
        unless params.empty?
          return "#{method}#{path}#{timestamp}#{params.to_json}"
        end

        "#{method}#{path}#{timestamp}"
      end

      def process(response)
        data = JSON.parse(response.body, symbolize_names: true)
        raise Error.new(response.code, data) if Error.error_response?(response)

        data
      end
    end
  end
end
