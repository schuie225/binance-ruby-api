# frozen_string_literal: true

require 'uri'
require 'hashie'

module Binance
  class Client
    include HTTParty

    query_string_normalizer proc { |query|
      query = query.map do |key, value|
        "#{key}=#{value}"
      end.join('&')
      URI.escape(query)
    }

    class << self
      def public_send(path: '/', params: {})
        response = get(path, query: params, headers: build_headers)
        process(response)
      end

      def private_send(method, path, params: {})
        params.delete_if { |k, v| v.nil? }
        params = params.merge(timestamp: timestamp)

        params = params.merge(signature: signature(params: params))

        case method
        when :get
          response = send(method, path, headers: build_headers, query: params, :debug_output => $stdout) # :debug_output => $stdout
        else
          response = if params.empty?
                      send(method, path, headers: build_headers)
                    else
                      send(method, path, headers: build_headers, query: params, :debug_output => $stdout)
                    end
        end
        process(response)
      end

      private

      def timestamp
          Time.now.utc.strftime('%s%3N')
      end

      def signature(params:)

        payload = params.map do |key, value|

        # if value.kind_of?(Array)
          # value = value.map { |item| '"' + "#{item}" + '"' }
          # value = "[#{value.join(',')}]"
        # end

          # value = "[#{value.join(',')}]" if value.kind_of?(Array)
          # value = value.to_json
          "#{key}=#{value}"
        end.join('&')


        payload = URI.escape(payload)

        Authentication.signature(payload)
      end

      def build_headers
        {
          "Accept": 'application/json',
          "Accept-Charset": 'UTF-8',
          "Content-Type": 'application/json',
          "X-MBX-APIKEY": Authentication.public_api_key
        }
      end

      def process(response)
        raise Error.new(response.code, data) if Error.error_response?(response)

        Hashie::Mash.new JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
