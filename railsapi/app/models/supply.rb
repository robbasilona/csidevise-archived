class Supply < ApplicationRecord
	has_many :stocks
	has_many :pins, :through => :stocks
end
