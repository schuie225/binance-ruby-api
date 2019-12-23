#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift('./lib')

require 'binance'

puts Binance::Market.server_time