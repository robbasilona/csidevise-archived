include Geokit::Geocoders

class EvacCenter < ApplicationRecord
	acts_as_mappable :default_units => :kms,
                   	 :default_formula => :sphere,
					 :lat_column_name => :latitude,
                     :lng_column_name => :longitude

	def self.get_result(msg)
	 	# rever geo(q)
	 	#latlng
	 	#compare latlng to db
	 	#Geokit::given two points, compare distance
	 	#get feasible solutions
		# geocoder = GoogleGeocoder.geocode(msg)
		results =  EvacCenter.within(10, :origin=>msg)
		response = "We recommend you to take shelter on these areas: "

		results.each do |res|
			response += res.name + "; "
		end
		response
	end
end
