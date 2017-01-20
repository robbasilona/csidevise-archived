include Geokit::Geocoders

class EvacCenter < ApplicationRecord
# <<<<<<< HEAD
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
		# =======
	# acts_as_mappable :default_units => :kms, :default_formula => :sphere, :lat_column_name => :latitude, :lng_column_name => :longitude
	#
  # def self.rank(origin)
  #  json = Jbuilder.new do |js|
  #    self.all do |dst|
  #      js.id dst.id
  #      js.name dst.name
  #      js.latitude dst.latitude
  #      js.longitude dst.longitude
  #      js.score dst.score(origin)
  #    end
  #  end
  # end
	#
  # def score(origin)
  #  dist = self.distance_to(origin, :units => :meters)
  #  dist + (self.quantity / self.capacity) * dist
  # end
	#
	# def self.get_result(msg)
	# 	results =  EvacCenter.within(10, :origin=>msg)
	# 	response = "We recommend you to take shelter on these areas: "
	# 	results.each do |res|
	# 		response += res.name + "; "
	# 	end
	# 	response
# >>>>>>> 45747a61e6c73f4de5a18069feaf00ca49bb726b
	end
end
