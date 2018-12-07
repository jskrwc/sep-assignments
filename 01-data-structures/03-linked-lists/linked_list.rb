require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = @head
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail === nil   # if no tail
      return nil
    elsif @head.next === nil   # if list is only head
      @tail = nil
    else              # cycle thru to remove
      current_node = @head
      while current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != @tail
      puts current_node.data
      current_node = current_node.next
    end
    puts current_node.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @tail == node       # if node is tail (or also, where list of 1)
      remove_tail
    elsif @head == node    # remove head
      @head = @head.next
    else                  # remove a middle node
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
      temp_node = @head
      @head = node
      @head.next = temp_node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp_node = @head
    if @head === nil    # empty list
      return nil
    elsif @head === @tail  # list of 1
      @head = nil
      @tail = nil
      return temp_node
    else
      @head = @head.next
      return temp_node
    end
  end

  #This method, needed for the benchmarking exercise, finds a specified value in the linked list and returns the node
  def find(value)
    current_node = @head
    while  current_node != nil
      if current_node.data  == value
       return current_node
      end
      current_node = current_node.next
    end
    return nil
  end


end
