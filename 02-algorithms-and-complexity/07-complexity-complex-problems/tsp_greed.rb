require_relative 'city_node'
require_relative 'neighbor_graph'

def create_itinerary(start_city)
  start_city.visited = true   # mark home city as visited
  puts "itinerary starting city:  #{start_city.name}"

  start_city.neighbors.length.times do
    next_city = nearest_possible_neighbor(start_city)
    puts "next city is: #{next_city.city.name}"
    start_city = next_city.city
  end
end

# method to find the nearest (unvisited) neighbor
def nearest_possible_neighbor(current_city)
  neighbor_cities = current_city.neighbors
  nearest_neighbor = neighbor_cities[0]

  # iterate thru neighbors to find the closest
  neighbor_cities.each do |current_neighbor|
    if current_neighbor.city.visited == false && current_neighbor.distance < nearest_neighbor.distance
      nearest_neighbor = current_neighbor  # ***
    end
  end
  nearest_neighbor.city.visited = true   # mark it visited
  return nearest_neighbor
end


c0 = City.new("San Francisco")
c1 = City.new("Atlanta")
c2 = City.new("Boston")
c3 = City.new("Columbus")
c4 = City.new("Denver")
c5 = City.new("Washington")


# City distances matrix -- found online
c0.neighbors = [Neighbor.new(c1, 2503), Neighbor.new(c2, 3119), Neighbor.new(c3, 2473), Neighbor.new(c4, 1276), Neighbor.new(c5, 2838) ]
c1.neighbors = [Neighbor.new(c0, 2503), Neighbor.new(c2, 1090), Neighbor.new(c3, 566), Neighbor.new(c4, 1403), Neighbor.new(c5, 633) ]
c2.neighbors = [Neighbor.new(c1, 1090), Neighbor.new(c0, 3119), Neighbor.new(c3, 783), Neighbor.new(c4, 1980), Neighbor.new(c5, 441) ]
c3.neighbors = [Neighbor.new(c1, 566), Neighbor.new(c2, 783), Neighbor.new(c0, 2473), Neighbor.new(c4, 1276), Neighbor.new(c5, 417) ]
c4.neighbors = [ Neighbor.new(c1,  1276), Neighbor.new(c2, 1980), Neighbor.new(c3, 1276), Neighbor.new(c0, 1276), Neighbor.new(c5, 1694) ]
c5.neighbors = [ Neighbor.new(c1,  633), Neighbor.new(c2, 441), Neighbor.new(c3, 417), Neighbor.new(c4, 1694), Neighbor.new(c0, 2838) ]


# puts nearest_possible_neighbor(c0)
create_itinerary(c0)
