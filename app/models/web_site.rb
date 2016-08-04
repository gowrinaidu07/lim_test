require 'open-uri'
class WebSite < ActiveRecord::Base
	
	validates :url, presence: true,uniqueness: true, format: URI::regexp(%w(http https))
	validate :parse_url	

	def parse_url
		begin
			page = Nokogiri::HTML(open(url))
			self.links = page.css("a").map do |link|
		    if (href = link.attr("href")) && !href.empty?
		      URI::join(url, href)
		    end
		  end.compact.uniq
			%w(h1 h2 h3).each do |header_tag|
				self[header_tag] = page.css(header_tag).map{|x| x.text }.compact.uniq
			end			
		rescue Exception => e
			errors.add(:url, e.message)
		end
	end 
end
