
# frozen_string_literal: true

module Binance
  class System
    class << self
      def status
        Client.public_send(path: '/wapi/v3/systemStatus.html')
      end
    end
  end
end
