class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new{}
      # in this hash, title of each film links to array of node objects, excluding the one to which it belongs
      # i.e. actor0.hash = {"movie", [actor1, actor2, actor3]}
  end
end
