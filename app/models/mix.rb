class Mix < ActiveRecord::Base
	def self.get_latest
		self.order("airdate DESC").first
	end

	validates :url, :presence => true
end
