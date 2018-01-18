require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_crypto
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	currencies = page.css("a[class=currency-name-container]").map{|crypto| crypto.text.downcase}
	rates = page.css("a[class=price]").map{|crypto| crypto.text.downcase}
	crypto_rates = Hash[currencies.zip(rates)]
	puts crypto_rates
end

get_crypto