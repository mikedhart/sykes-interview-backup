class Property < ApplicationRecord
	#Assocoations
	has_one :location, primary_key: :_fk_location, foreign_key: :__pk
	has_many :price_bands, primary_key: :__pk, foreign_key: :_fk_property
	has_many :bookings, primary_key: :__pk, foreign_key: :_fk_property

	#Scopes
	scope :location, -> (location_id) { where _fk_location: location_id }
	scope :beds, -> (beds) { where(beds: beds) }
	scope :sleeps, -> (sleeps) { where(beds: sleeps) }
	scope :near_beach, -> (near_beach) { where(near_beach: near_beach) }
	scope :accepts_pets, -> (accepts_pets) { where(accepts_pets: accepts_pets) }

	def location_name
		self.location.location_name if self.location
	end
end
