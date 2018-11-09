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
        # @queue[0] = nil   #doesnt work
        # result = @queue.delete[0]   #not work
        # result = @queue.delete_at(0)  #not work-- break into 2 lines..
    result = @queue[0]
    @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue.last
    return result
  end

  def empty?
    @queue.length == 0
  end
end
