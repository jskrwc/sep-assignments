class City
  attr_accessor :name
  attr_accessor :lon     # longitude  (degrees)
  attr_accessor :lat     # latitude   (degrees)


  def initialize(name, lon, lat)
    @name = name
    @lon = lon
    @lat = lat
  end
end
