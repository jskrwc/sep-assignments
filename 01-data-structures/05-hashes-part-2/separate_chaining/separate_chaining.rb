require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    i = index(key, size)
    n = Node.new(key, value)


    @items[i] = LinkedList.new if @items[i] == nil  # no collision, new linkedlist
    @items[i].add_to_tail(n)      # collision / add to tail of linkedlist
    @count +=1

    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, size)
    if @items[i]
      node = @items[i].head
      while node != nil
        return node.value if node.key == key
        node = node.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count / size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(size * 2)
    old_array.each do |list|
      if list != nil
        node = list.head
        while node != nil
          i = index(node.key, size)
          @items[i] = LinkedList.new if @items[i] == nil
          @items[i].add_to_tail(Node.new(node.key, node.value))
          node = node.next
        end
      end
    end
  end

  # def resize # alternate way to resize hash
  #   new_array = Array.new(size * 2)
  #   @items.each do |list|
  #     if list != nil
  #       node = list.head
  #       while node != nil
  #         i = index(node.key, new_array.size)
  #         new_array[i] = LinkedList.new if new_array[i] == nil
  #         new_array[i].add_to_tail(Node.new(node.key, node.value))
  #         node = node.next
  #       end
  #     end
  #   end
  #   @items = new_array
  # end


  def hash_print
    @items.each_with_index do |list, index|
      if list != nil
        puts "index: #{index}"
        node = list.head
        while node
          puts "    key: #{node.key}, value: #{node.value}"
          node = node.next
        end
      end
    end
    puts "Load Factor: #{load_factor},   Count: #{@count}"
  end

  star_wars_movies = SeparateChaining.new(6)
  star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
  star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
  star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
  star_wars_movies["Star Wars: A New Hope"] = "Number Four"
  star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
  star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

  star_wars_movies.hash_print

end
