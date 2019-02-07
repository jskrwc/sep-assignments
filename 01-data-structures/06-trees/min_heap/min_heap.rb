require_relative 'node'

class MinHeapTree

  attr_accessor :root   #allow root to change

  def initialize(root)
    @root = root
  end


# heap property:  parent < child  (min heap)
  def insert(root, node)
    # insert node
    if root == nil
      root == node
      return
    end

    # if root.rating > node.rating  # if node < root, swap, and make node new root
    #   temp = root
    #   @root = node
    #   node = temp
    #   insert(@root, node)
    # else
    #   if root.left == nil
    #     root.left = node
    #   elsif root.right == nil
    #     rool.right = node
    #   elsif


    # Breadth first search to find empty leaf to place node
    queue = Queue.new
    queue.enq(@root)
    while queue.size > 0
      var = queue.deq
      if var.left != nil && var.right != nil
        queue.enq(var.left)
        queue.enq(var.right)
      else
        break
      end
    end

    if var.left == nil
      var.left = node
    elsif var.right == nil
      var.right = node
    end
    parent = var
puts "parent: #{parent.title} #{parent.rating}  node: #{node.title} #{node.rating}"
    if parent.rating > node.rating  # if out of order, swap and sift up)
      swap(parent, node)
      # sift_up(node) # check node against parent for hierarchy
    end
puts "current heap:"
printf

  end

  def sift_up(node)
    # breadth first search to find node and its parent
    # swap if out of order and repeat as needed or until hit root
    return if root == node
    queue2 = Queue.new
    queue2.enq(@root)
    while queue2.size > 0
      var2 = queue2.deq

      if var2.left == node || var2.right == node   ### if find node
        parent = var2
        if parent.rating > node.rating
          swap(parent, node)
          sift_up(node)
        else
          return   # in order
        end
      end

      if var2.left != nil && var2.right != nil
        queue2.enq(var2.left)
        queue2.enq(var2.right)
      else
        break
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

    left = find(root.left, data)
    return left if left != nil
    right = find(root.right, data)
    return right if right != nil
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

  # Breadth First Search
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

private
  def swap(parent_node,child_node)
    puts "current heap:"
    printf
    
    puts "swapping parent #{parent_node.title} and child #{child_node.title}"
    temp_left = child_node.left     #set aside child's kids
    temp_right = child_node.right

    # if child is on left
    if parent_node.left == child_node
      child_node.left = parent_node
      if parent_node.right != nil
        child_node.right = parent_node.right
      end
    else   # child is on the right
      child_node.right = parent_node
      if child_node.left != nil
        child_node.left = parent_node.left
      end
    end
    parent_node.left = temp_left
    parent_node.right = temp_right
  puts "after swapping parent #{parent_node.title} and child #{child_node.title}"

  end
