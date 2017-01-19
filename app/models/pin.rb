class Pin < ApplicationRecord
	has_many :stocks
	has_many :supplies, :through => :stocks
end
