require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
links = page.css("a[class=lientxt]").map{|link| "http://annuaire-des-mairies"+link['href'][1..-1]}
print links
end

get_all_the_urls_of_val_doise_townhalls


def get_the_email_of_a_townhal_from_its_webpage(links)
links.each{|link| 
	page = Nokogiri::HTML(open(link))
	page.css("tr td.style27 p.Style22 font").each do |email|
	#condition pour récupérer uniquement l'adresse mail.
		if email.to_str.include? "@"
			puts email.text
		end
		end
	}
end

get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)
