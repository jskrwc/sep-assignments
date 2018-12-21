class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size) # make more readable -- using i for  index(key,size)
    if @items[i] == nil      # if unoccupied / no collision
      @items[i] = HashItem.new(key,value)
    elsif @items[i].key == key # key is same, so it's a duplicate or overwrite with new value
      @items[i] = HashItem.new(key,value)
    else  # collision -- not nil, but a new key, so resize until nil
      while @items[i].key != nil && @items[i].key != key do
        resize
        j = index(key, size)
        break if @items[j] == nil
      end
      @items[j] = HashItem.new(key, value)
    end
    # puts "size of hash: #{size}"
    # puts @items
  end


  def [](key)
    i = index(key, size)
    @items[i].value if @items[i]   # return value if not a nil
  end

  def resize
    new_array = Array.new(size * 2)
    @items.each do |item|
      if item != nil
        i = index(item.key, size * 2)
        new_array[i] = item
      end
    end
    @items = new_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size   #nb  this hashing is overly simple and has limited functionality -- e.g. anagrams will never be unique
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
