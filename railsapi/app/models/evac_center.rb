class EvacCenter < ApplicationRecord
  acts_as_mappable :default_unit => :kms, :default_formula => :sphere, :distance_field_name => :distance, :lat_column_name => :latitude, :lng_column_name => :longitude

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
end
