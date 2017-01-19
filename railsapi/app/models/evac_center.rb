include Geokit::Geocoders

class EvacCenter < ApplicationRecord
	acts_as_mappable :default_units => :kms, :default_formula => :sphere, :lat_column_name => :latitude, :lng_column_name => :longitude

  def score(src)
		dist = self.distance_to(src, :units => :kms)
		per = self.quantity.to_f / self.capacity.to_f
		dist + per * dist
  end

  def self.rank(src)
		self.all.sort { |x, y| x.score(src) <=> y.score(src) }
  end

	def self.get_result(msg)
		loc = GoogleGeocoder.geocode(msg)
		src = EvacCenter.new(latitude: loc.lat, longitude: loc.lng, name: 'User')
		results =  EvacCenter.within(20, :origin=>[loc.lat, loc.lng]).sort { |x, y| x.score(src) <=> y.score(src) }
		response = 'We recommend you to take shelter on these areas: '
		results.each do |res|
			response += res.name + ':' + res.quantity.to_s + '/' + res.capacity.to_s + ' - '
		end
		response += 'Keep safe! RefuGeo'
	end
end
# @src = EvacCenter.new(latitude: 14.6476383, longitude: 121.0646582, name: 'User')
# EvacCenter.first.score(@src)
# EvacCenter.rank(@src)
# EvacCenter.get_result('Krus Na Ligas')
