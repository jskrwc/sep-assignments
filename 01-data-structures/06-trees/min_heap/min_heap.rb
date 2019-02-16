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
    puts "node to insert: #{node.title} "
    puts "current heap1- starting iterate:"
    printf

    if root == nil      # if no root, make node the root
      root == node
      return
    end
    # Breadth first search to find empty leaf to place node
    # (find parent "var" and insert node into the left (else right) under it)
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
    parent = var   ## parent FOUND!  node inserted as its child

puts "after insert:   parent: #{parent.title} #{parent.rating}  node: #{node.title} #{node.rating}"

    if node.rating < parent.rating  # if out of order, swap and sift up)
      swap(parent, node)
          puts "swapped #{node.title} with #{parent.title}"
          puts "new heap is: "
          printf
          puts "check for sift up+++++   for the root: #{root.title}   and parent #{parent.title}"

      if parent != root   # sift up unless at the root
        grandparent = find_parent(root, parent)
              puts "grandparent is #{grandparent.title}    ."
        while parent.rating < grandparent.rating
          swap(grandparent, parent)
          grandparent = find_parent(root, parent)
        end
      end
    end

########
# ITERATIVE end
  puts "===ITERATIVE END"
    @root = root
    puts "printf to show heap at end of an iteration:  "
    printf
    puts "root at end of this iteration:   #{root.title} #{root.rating}"
    puts"=============="

  end

  # Recursive Depth First Search
  def find(root, data)
    puts "+++++find      at start:  root = #{root.title}    data = #{data}"
    if data == nil || root == nil
      return nil
    elsif root.title == data
      return root
    end

    queue = Queue.new
puts "@root = #{@root.title}"
    queue.enq(@root)
    while queue.size > 0
      var = queue.deq
              puts " var = dequeue var = #{var.title}     data = #{data}"
      if var.title == data
        puts "found var = #{var.title}"
        return var
      end
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
    return nil
  end

  # Remove node containing given data
  def delete(root, data)
    if data == nil || root == nil
      return nil
    end
    target_node = find(root, data)
    puts "++++ delete    root is #{root.title}   data is #{data}    target is #{target_node.title}"
    if target_node == nil
      return nil
    end

    # swap target node with its lowest child.
    # repeat sift down until no kids
    # then zap it

puts "++++++ starting delete -- "
puts "target_node is  = #{target_node.title} #{target_node.rating}"
puts "      target_node.left = #{target_node.left} and target_node.right = #{target_node.right}"
puts " target node.left is nil" if target_node.left == nil


    while target_node.left =! nil && target_node.right != nil # as long as 2 kids
      puts " in while loop"
      swap(target_node, lowest_child(target_node))
      target_node = find(root,data)
    end
    # now 0 or 1 children -- if has a child, swap
    if lowest_child(target_node) != nil
      puts "starting if theres a lowest child...."
      swap(target_node, lowest_child(target_node))
      target_node = find(root,data)
    end
    # target now in place, null it
    target_node.title = nil
    target_node.rating = nil
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
      puts "#{var.title}: #{var.rating}" if var.title != nil
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
  end

private
  def swap(parent_node,child_node)
    temp_title = parent_node.title
    temp_rating = parent_node.rating
    parent_node.title = child_node.title
    parent_node.rating = child_node.rating
    child_node.title = temp_title
    child_node.rating = temp_rating
  end

  def find_parent(root, parent)  # breadth first seach - returns parent (or nil)
        puts "in find parent...  parent = #{parent.title}    root = #{root.title}"
    if parent == root
        puts " parent =root so returning nil"
      return nil
    end
    queue = Queue.new
    queue.enq(@root)      #@
    while queue.size > 0
      var = queue.deq
puts "first dequeue   #{var.title}: #{var.rating}" if var.title != nil
puts "var.left = #{var.left.title} and var.right = #{var.right.title}"
      if var.left == parent || var.right == parent
puts "return var = #{var.title}"
        return var
      end
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
    return nil
  end

  def lowest_child(node)  # returns lowest rated child or nil
    puts "starting lowest_child method:   node = #{node} #{node.title} #{node.rating} "
    puts " node.left = #{node.left} node.right = #{node.right}"
    puts "node.left is nil" if node.left == nil
    puts " why the hell is node.left = false, should be nil" if node.left == false
    puts "node.right is nil" if node.right == nil
    if node.left == nil && node.right == nil
      puts "returning nil"
      return nil
    elsif node.left = nil
      puts "returning node.right #{node.right}"
      return node.right
    elsif node.right = nil
      puts "returning node.left #{node.left}"
      return node.left
    else
      puts "returning lowest of left or right children"
      node.left.rating < node.right.rating ? node.left : node.right
    end
  end

#   def swap2(parent_node,child_node)
# #    # puts "initial root in swap method: #{@root} #{@root.title} #{@root.rating}"
#     # puts "current heap (before a swap):"
#     # printf
#     #
# #    # puts "swapping parent #{parent_node} #{parent_node.title} and child #{child_node}  #{child_node.title}"
#     temp = child_node
#     temp_left = child_node.left     #set aside child's kids
#     temp_right = child_node.right
#
#     # assign child the parent's attributes
#     # child_node = parent_node
#     # assigning child_node its new kids
#     if parent_node.left == temp  # if child was on left
#       child_node.left = parent_node
#         # child_node.left.left = temp_left  #refactored below (after conditional)
#         # child_node.left.right = temp_right
#       child_node.right = parent_node.right
#     else   # child was on the right
#       child_node.right = parent_node
#         # child_node.right.left = temp_left
#         # child_node.right.right = temp_right
#       child_node.left = parent_node.left
#     end
#
#     # assign child attributes to parent (swapped)
#       puts "parent_node.title #{parent_node} #{parent_node.title} being replaced by child_node #{temp} #{temp.title} ======="
#
#       # assign the childs orignial kids to the parent
#       parent_node.left = temp_left
#       parent_node.right = temp_right
#       parent_node = temp
#
#     # assign the remaining parent attributes to the child
#
#     puts "before root change   @root:  #{@root.title}"
#     @root = parent_node # if root changed # reassign @root to new root
#     puts "after root change   @root:  #{@root.title}"
#   end


  end
