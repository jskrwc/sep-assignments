require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width) { Array.new(height) } #create width x height (rows x cols) 2D array
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      self.matrix[x][y] = pixel
    end
  end

  def at(x, y)
    inbounds(x,y) ? matrix[x][y] : nil
  end

  private

  def inbounds(x, y)
    x > 0 && x <= width && y > 0 && y <= height
  end

end
