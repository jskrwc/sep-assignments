require_relative 'city_node'

class Neighbor
  attr_accessor :city
  attr_accessor :distance

  def initialize(city, distance)
    @city = city
    @distance = distance
  end
  
end
