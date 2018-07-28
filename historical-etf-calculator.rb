#!/usr/bin/env ruby
require 'csv'

data = CSV.read('spy-historical.csv', headers: true).select do |row|
  Date.parse(row['Date']) > Date.today << 12 * 40
end
total_shares = data.map { |row| 100 / row['Close'].to_f }.reduce(:+)
total_wealth = data[-1]['Close'].to_f * total_shares
puts total_wealth
