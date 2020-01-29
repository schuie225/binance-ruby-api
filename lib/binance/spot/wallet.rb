
# frozen_string_literal: true

module Binance
  class Wallet
    class << self
      def margin_enable(email:)
        Client.private_send(:post, '/sapi/v1/sub-account/margin/enable', params: {email: email})
      end
    end
  end
end
