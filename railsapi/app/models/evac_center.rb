include Geokit::Geocoders

class EvacCenter < ApplicationRecord
	acts_as_mappable :default_units => :kms, :default_formula => :sphere, :lat_column_name => :latitude, :lng_column_name => :longitude

  def self.rank(origin)
   json = Jbuilder.new do |js|
     self.all do |dst|
       js.id dst.id
       js.name dst.name
       js.latitude dst.latitude
       js.longitude dst.longitude
       js.score dst.score(origin)
     end
   end
  end

  def score(origin)
   dist = self.distance_to(origin, :units => :meters)
   dist + (self.quantity / self.capacity) * dist
  end

	def self.get_result(msg)
		results =  EvacCenter.within(10, :origin=>msg)
		response = "We recommend you to take shelter on these areas: "
		results.each do |res|
			response += res.name + "; "
		end
		response
	end
end
