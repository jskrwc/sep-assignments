class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]  # why need?
    @tail = @queue.last
  end

  def dequeue
    result = @queue.delete_at(0)  # delete and return head
    @head = @queue[0]
    @tail = @queue.last
    return result
  end

  def empty?
    @queue.length == 0
  end
end
