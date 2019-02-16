require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end


# use DFS to find place to add data and add as new leaf
  def insert(root, node)
    if node.rating > root.rating
      if root.right == nil
        root.right = node
      else
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root == nil
      return nil
    elsif root.title == data
      return root
    end

    right = find(root.right, data)
    if right != nil
      return right
    end
    left = find(root.left, data)
    if left != nil
      return left
    end
  end

  # Remove node containing given data
  def delete(root, data)
    if data == nil || root == nil
      return nil
    end
    node = find(root, data)
    if node == nil
      return nil
    else
      node.title = nil
      node.rating = nil
    end
  end

  # Recursive Breadth First Search
  #   enqueue root onto queue
  #   while queue not empty
  #     dequeue a node
  #     set to variable
  #     output variable
  #     enqueue children
  def printf(children=nil)
    if @root == nil
      return nil
    end
    queue = Queue.new
    queue.enq(@root)
    while queue.size > 0
      var = queue.deq
      puts "#{var.title}: #{var.rating}" if var.title != nil
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end

  end

end
