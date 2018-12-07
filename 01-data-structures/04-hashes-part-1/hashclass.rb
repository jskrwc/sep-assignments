class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = @items[index(key,size)]
    if item.nil?      # if unoccupied / no collision
      @items[index(key,size)] = HashItem.new(key,value)
    elsif item.key == key && item.value != value           # if collision --> resize
      resize
      item.value = value
    end
    # puts "size of hash: #{{size}}"
    puts @items
  end


  def [](key)
    item = @items[index(key,@size)]
    item.value   # what if nil, will return nil ??
  end

  def resize
    new_array = Array.new(size *2)
    @items.each do |item|
      if item  != nil?
        new_array[index(item.key, @size)] = item
      end
    end
    @items = new_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end
