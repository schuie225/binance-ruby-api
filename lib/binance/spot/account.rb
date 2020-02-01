# frozen_string_literal: true

module Binance
  class Spot
    class Account
      class << self
        def all_coins
          Client.private_send(:get, '/sapi/v1/capital/config/getall')
        end

        def asset_details
          Client.private_send(:get, '/wapi/v3/assetDetail.html')
        end

        def sub_account(email:)
          Client.private_send(:get, '/wapi/v3/sub-account/assets.html', params: { email: email })
        end
      end
    end
  end
end
