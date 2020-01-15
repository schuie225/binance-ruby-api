module Binance
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
                Client.private_send(:post, '/api/v3/order/test', params: params)
            end

            def place_order(symbol:, side:, type:, quantity:, params: {})
                params = params.merge({
                    symbol: symbol,
                    side: side,
                    type: type,
                    quantity: quantity
                }).compact
                Client.private_send(:post, '/api/v3/order', params: params)
            end

            def query(symbol:, params: {})
                Client.private_send(:get, '/api/v3/order', params: merge_symbol(symbol, params))
            end

            def cancel(symbol:, params: {})
                Client.private_send(:delete, '/api/v3/order', params: merge_symbol(symbol, params))
            end

            def open_orders(symbol: nil)
                Client.private_send(:get, '/api/v3/openOrders', params: {symbol: symbol})
            end

            def merge_symbol(symbol, params)
                params.merge({
                    symbol: symbol
                }).compact
            end
        end
    end
end