require_relative 'node'

class OpenAddressing

  def items
    return @items
  end

  def initialize(size)
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    i = index(key, size)      # use i to store index

    if @items[i] == nil    # if index is emtpy, assign the new item to index
      @items[i] = Node.new(key, value)
      @count += 1
    elsif @items[i].key == key && @items[i].value == value   # if keys and values match--> dupe so return
      return
    else    # value not match, find next open if can, otherwise resize until
      nexti = next_open_index(i)
      if @items[i].key == key && @items[i].value != value && nexti == -1  # key matches, value does not, no next open available
        resize
        @items[nexti].value = value
        @count +=1
      elsif nexti == -1  # key and value match, but no available next open
        resize
        # @items[nexti].value = value
        self[key] = value
      else
        @items[nexti] = Node.new(key, value)
        @items[nexti].value = value
        @count +=1
      end
    end
  end

  def [](key)
    i = index(key, size)
    while i < size
      if @items[i] != nil && @items[i].key == key
        return @items[i].value
      else
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    nexti = index
    while @items[nexti] != nil
      nexti += 1    # increment index by 1 to look for open space
    end
    if nexti >= size
      return -1
    else
      return nexti
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |item|
      if item != nil
        i = index(item.key, @items.length)
        @items[i] = Node.new(item.key, item.value)
      end
    end
  end

  def print
    @items.each_with_index do |item, index|
      if item != nil
        puts "Index: #{index},  Key: #{item.key},  Value: #{item.value}"
      end
      puts "Count = #{@count}"
    end
  end

star_wars_movies = OpenAddressing.new(6)
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

star_wars_movies.print


end
