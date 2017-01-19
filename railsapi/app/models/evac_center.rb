include Geokit::Geocoders

class EvacCenter < ApplicationRecord
	acts_as_mappable

	class << self
		def get_result(msg)
		 	# rever geo(q)
		 	#latlng
		 	#compare latlng to db
		 	#Geokit::given two points, compare distance
		 	#get feasible solutions
			geocoder = GoogleGeocoder.geocode(msg)
		return geocoder
		end
	end
end
