#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'optparse'

url = 'https://vfm.com.vn/apiv2/nav/getAllLatestNav.php'
uri = URI(url)

response = Net::HTTP.get(uri)
symbols = JSON.parse(response)


symbols.each do |symbol|
	symbol_data = symbols[symbol[0]]

	trade_code = symbol_data['trade_code']
	money = symbol_data['nav_ccq'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse

	puts trade_code + ": " + money
end