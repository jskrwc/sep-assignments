require_relative 'node'

class Graph

  # film_actor_hash-- will have title of each film linked to array of node objects, excluding the one to which it belongs
  # i.e. {"movie", [actor1, actor2, actor3]}

  # film_list -- array of films

  def initialize(node)
    @film_list = Array.new
    @target_actor = node
  end


  def find_kevin_bacon(start_actor)
    # puts "start_actor = #{start_actor.name}"

  # first check to see if actor is directly in movie w/ Kevin Bacon
    @target_actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|      #  iterate thru ea actor in kb movie
        if actor == start_actor   #  Found actor in kb movie
          @film_list.push(title)
          puts "#{@film_list}"
          return @film_list
        end
      end
    end

    #  NOT FOUND if no films or connection too remote (>6 degrees)
    if start_actor.film_actor_hash.empty? || @film_list.length > 6
      @film_list =[]
      return nil
    end

    # iterate through the hash
    start_actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|
        if actor.name == "Kevin Bacon"
          @film_list.push(title)
          puts "#{film_list}"
          return
        else
          @film_list.push(title)
          find_kevin_bacon(actor)
        end
      end
    end
  end

end
