class PriceBand < ApplicationRecord
	has_many :properties, primary_key: :_fk_property, foreign_key: :__pk
end
