# frozen_string_literal: true

module Binance
  class Spot
    class System
      class << self
        def system_status
          Client.public_send(path: '/wapi/v3/systemStatus.html')
        end
      end
    end
  end
end
