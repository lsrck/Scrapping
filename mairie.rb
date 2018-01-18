require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
page.css("tr td.style27 p.Style22 font").each do |node|
	#condition pour récupérer uniquement l'adresse mail.
	if node.to_str.include? "@"
		puts node.text
	end
	end
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
page.css("a[class=lientxt]").each{|link| puts "http://annuaire-des-mairies"+link['href'][1..-1]}
end

get_all_the_urls_of_val_doise_townhalls

