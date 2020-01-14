module Binance
    class Future
        class Testnet
            class Account
                class << self
                    def account
                        Client.private_send(:get, '/fapi/v1/account')
                    end
                end
            end
        end
    end
end