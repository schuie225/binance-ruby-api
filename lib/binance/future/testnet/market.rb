# frozen_string_literal: true

module Binance
    class Future
        class Testnet
            class Market
                class << self
                    def ping
                        Client.public_send(path: '/fapi/v1/ping')
                    end

                    def server_time
                        Client.public_send(path: '/fapi/v1/time')
                    end

                    def exchange_info
                        Client.public_send(path: '/fapi/v1/exchange_info')
                    end

                    def depth(symbol:, limit: 100)
                        Client.public_send(path: '/fapi/v1/depth', params: {symbol: symbol, limit: limit})
                    end

                    def trades(symbol:, limit: 500)
                        Client.public_send(path: '/fapi/v1/trades', params: {symbol: symbol, limit: limit})
                    end

                    def historicalTrades(symbol:, limit: 500, fromId: nil)
                        Client.public_send(
                            path: '/fapi/v1/historicalTrades', 
                            params: {
                                symbol: symbol, 
                                limit: limit, 
                                fromId: fromId
                            }.compact
                        )
                    end

                    def aggTrades(symbol:, limit: 500, fromId: nil, startTime: nil, endTime: nil)
                        Client.public_send(
                            path: '/fapi/v1/aggTrades', 
                            params: {
                                symbol: symbol, 
                                limit: limit, 
                                fromId: fromId, 
                                startTime: startTime,
                                endTime: endTime
                            }.compact
                        )
                    end

                    def klines
                        Client.public_send(path: '/fapi/v1/klines')
                    end
                    
                    def ticker_24hr
                        Client.public_send(path: '/fapi/v1/ticker/24hr')
                    end

                    def ticker_price
                        Client.public_send(path: '/fapi/v1/ticker/price')
                    end

                    def bookTicker
                        Client.public_send(path: '/fapi/v1/bookTicker')
                    end

                    def allForceOrders
                        Client.public_send(path: '/fapi/v1/allForceOrders')
                    end
                end
            end
        end
    end
end