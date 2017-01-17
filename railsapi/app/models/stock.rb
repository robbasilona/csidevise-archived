class Stock < ApplicationRecord
	belongs_to :pin
	belongs_to :supply
end
