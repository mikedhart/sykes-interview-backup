class PriceBand < ApplicationRecord
	has_many :properties, foreign_key: :_fk_location
end
