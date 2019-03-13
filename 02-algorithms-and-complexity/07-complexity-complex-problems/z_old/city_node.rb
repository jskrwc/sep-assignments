class City
  attr_accessor :name
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize(name)
    @name = name
    @visited = false
    @neighbors = []   # array of nodes (neighboring cities) and distances
                      # eg. { [city1, distance1], [city2, distance2] ...}
  end
end
