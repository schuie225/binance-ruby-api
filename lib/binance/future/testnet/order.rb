module Binance
    class Future
        class Testnet
            class Order
                class << self
                    # testing place order
                    def test(symbol:, side:, type:, quantity:, params: {})
                        params = params.merge({
                            symbol: symbol,
                            side: side,
                            type: type,
                            quantity: quantity
                        }).compact
                        Client.private_send(:post, '/fapi/v1/order/test', params)
                    end
                end
            end
        end
    end
end