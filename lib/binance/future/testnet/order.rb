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
                        Client.private_send(:post, '/fapi/v1/order/test', params: params)
                    end

                    def place_order(symbol:, side:, type:, quantity:, params: {})
                        params = params.merge({
                            symbol: symbol,
                            side: side,
                            type: type,
                            quantity: quantity
                        }).compact
                        Client.private_send(:post, '/fapi/v1/order', params: params)
                    end

                    def cancel(symbol:, params: {})
                        Client.private_send(:delete, '/fapi/v1/order', params: merge_symbol(symbol, params))
                    end

                    def openorders(symbol:, params: {})
                        Client.private_send(:get, '/fapi/v1/openOrders', params: merge_symbol(symbol, params))
                    end

                    def merge_symbol(symbol, params)
                        params.merge({
                            symbol: symbol
                        }).compact
                    end
                end
            end
        end
    end
end