require_relative 'node'

class MinHeapTree

  attr_accessor :root   #allow root to change

  def initialize(root)
    @root = root
  end


# heap property:  parent < child  (min heap)
  def insert(root, node)

# # RECURSIVE begin
#    if root == nil
#      root == node
#      return
#     end

#     if root.rating > node.rating  # if node < root, swap, and make node new root
#       temp = root
#       # # root = node
#       #   root.title = node.title
#       #   root.rating = node.rating
#       # # node = temp
#       #   node.title = temp.title
#       #   node.rating = temp.rating
#       @root = node
#       node = temp
#       insert(@root, node)
#     else                          # if root < node -- no swap needed
#       if root.left == nil
#         root.left = node
#       elsif root.right == nil
#         root.right = node
#       elsif root.left.left != nil && root.left.right != nil
#         insert(root.right, node)
#       else
#         insert(root.left, node)
#       end
#     end
# # RECURSIVE end

#  ITERATIVE begin
    puts "root = #{root.title}"
    puts "current heap1- starting iterate:"
    printf

    if root == nil      # if no root, make node the root
      root == node
      return
    end

    # if node.rating < root.rating   # if node < root, swap them
    #   swap(root, node)
    #   # insert(root, node)    #  insert the new node(oldroot)
    #   return
    # end

    # Breadth first search to find empty leaf to place node (find parent)
    queue = Queue.new
    queue.enq(root)
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
    parent = var   ## parent FOUND!
puts "parent: #{parent.title} #{parent.rating}  node: #{node.title} #{node.rating}"

    if parent.rating > node.rating  # if out of order, swap and sift up)
      swap(parent, node)

    end

# ITERATIVE end

    puts "printf to show heap at end of an iteration:  "
    printf
    puts"=============="
    puts "root at end of iteration:  #{@root} #{@root.title} #{@root.rating}"
    puts "root.left - this is nil, but should be the Matrix here:  #{@root.left} ?"

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
    if root == nil    #@
      return nil
    end
    queue = Queue.new
    queue.enq(@root)      #@
    while queue.size > 0
      var = queue.deq
      # puts "printf  #{var}  #{var.title}: #{var.rating}" if var.title != nil
      puts "#{var.title}: #{var.rating}" if var.title != nil
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
  end

private
  def swap(parent_node,child_node)
    puts "initial root in swap method: #{@root} #{@root.title} #{@root.rating}"
    puts "current heap (before a swap):"
    printf

    puts "swapping parent #{parent_node} #{parent_node.title} and child #{child_node}  #{child_node.title}"
    temp = child_node
    temp_left = child_node.left     #set aside child's kids
    temp_right = child_node.right

    # assign child the parent's attributes
    child_node = parent_node
    # assigning child_node its new kids
    if parent_node.left == temp  # if child was on left
      child_node.left = parent_node
            # child_node.left.left = temp_left
            # child_node.left.right = temp_right
      child_node.right = parent_node.right
    else   # child was on the right
      child_node.right = parent_node
            # child_node.right.left = temp_left
            # child_node.right.right = temp_right
      child_node.left = parent_node.left
    end

    # assign child attributes to parent (swapped)
      puts "parent_node.title #{parent_node} #{parent_node.title} being replaced by child_node #{temp} #{temp.title} ======="

      parent_node = temp
      # assign the childs orignial kids to the parent
      parent_node.left = temp_left
      parent_node.right = temp_right

    # assign the remaining parent attributes to the child

    puts "before root change   @root:  #{@root.title}"
    @root = parent_node # if root changed # reassign @root to new root
    puts "after root change   @root:  #{@root.title}"

    puts "swapped out child #{parent_node} #{parent_node.title} and parent #{child_node}  #{child_node.title}"

    puts "here's the post swap out heap:"
    puts "root: #{@root} #{@root.title} #{@root.rating}"
    puts "root.left - this is nil, but should be the Matrix here:  #{@root.left} ?"
    puts "new parent's child left: #{child_node.left}  #{child_node.left.title}"
    # puts "printf"
    # printf
  end
