require_relative 'city'

def create_itinerary(start_city, city_graph)
  route = [start_city.name]
  # neighbor_cities = list of cities (but remove starting city)
  neighbor_cities = city_graph.delete_if {|x| x == start_city }

  while neighbor_cities.length > 0 do       # do while there are unvisited neighbors
    nearest_neighbor = neighbor_cities[0]

    # iterate thru neighbors to find the closest
    neighbor_cities.each do |target_neighbor|
      if distance(start_city, target_neighbor) < distance(start_city, nearest_neighbor)
        nearest_neighbor = target_neighbor
      end
    end
    route << nearest_neighbor.name
    start_city = nearest_neighbor
    neighbor_cities.delete(nearest_neighbor)
  end
  route
end


RAD_PER_DEG  = 0.017453293     # PI/180 degrees
Rmiles = 3956   # radius of Earth in miles

def distance(city1, city2)    # haversine formula to compute great circle distances
                              # nb need convert to radians
  lon1 = city1.lon * RAD_PER_DEG
  lat1 = city1.lat * RAD_PER_DEG
  lon2 = city2.lon * RAD_PER_DEG
  lat2 = city2.lat * RAD_PER_DEG
  dlon = lon2 - lon1
  dlat = lat2 - lat1

  a = Math.sin(dlat/2)**2 + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dlon/2)**2
  c = 2 * Math.asin( Math.sqrt(a))

  return Rmiles * c          # distance between the two points in miles
end


c0 = City.new("San Francisco", 38, 122)
c1 = City.new("Atlanta", 34, 84)
c2 = City.new("Boston", 42, 71)
c3 = City.new("Columbus", 40, 83)
c4 = City.new("Denver", 40, 105)
c5 = City.new("Washington", 39, 77)

city_graph = [c0, c1, c2, c3, c4, c5]

puts create_itinerary(c5, city_graph)
