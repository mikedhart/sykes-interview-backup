class Property < ApplicationRecord
	has_one :location, foreign_key: :__pk
	has_many :price_bands, foreign_key: :__pk
	has_many :bookings, foreign_key: :__pk

	def location_name
		self.location.location_name if self.location
	end
end
