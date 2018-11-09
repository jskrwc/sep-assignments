class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = item
  end

  def pop
    tempItem = self.top
    @stack.delete(top)  #delete at?
    self.top = @stack.last
    return tempItem
  end

  def empty?
    @stack.length == 0
  end
end
