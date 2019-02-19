require_relative 'node'

class MinHeapTree

  attr_accessor :root   #allow root to change

  def initialize(root)
    @root = root
  end


# heap property:  parent < child  (min heap)
  def insert(root, node)
    # puts "INSERTING   #{node.title}-------------- \n\n"
    # printf

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

    if node.rating < parent.rating  # if out of order, swap and sift up)
      swap(parent, node)
      if parent != root   # sift up unless at the root
        grandparent = find_parent(root, parent)
        while parent.rating < grandparent.rating
          swap(grandparent, parent)
          grandparent = find_parent(root, parent)
        end
      end
    end

    @root = root
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root == nil
      return nil
    elsif root.title == data
      return root
    end

    queue = Queue.new
    queue.enq(@root)

    while queue.size > 0
      var = queue.deq
      if var.title == data
        return var
      end
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
    return nil
  end

  # Remove node containing given data
  def delete(root, data)
    # puts "\n\n\n-------------------------\n\n"
    # puts "DELETING ====== #{data} \n\n"
    if data == nil || root == nil
      return nil
    end
    target_node = find(root, data)
    if target_node == nil
      return nil
    end

    # swap target node with its lowest child.
    # repeat sift down until no kids
    # then zap it

    while target_node.left && target_node.right # as long as 2 kids
      # puts "WHILE LOOP -------------\n\n\n"
      swap(target_node, lowest_child(target_node))
      target_node = find(root,data)
    end
    # now 0 or 1 children -- if has a child, swap
    if lowest_child(target_node)
      swap(target_node, lowest_child(target_node))
      target_node = find(root,data)
    end

    # target now in place, zap it
    target_node.title = nil
    target_node.rating = nil
  end


  # Breadth First Search
  def printf(children=nil)
    if root == nil
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
    temp_title = parent_node.title
    temp_rating = parent_node.rating
    parent_node.title = child_node.title
    parent_node.rating = child_node.rating
    child_node.title = temp_title
    child_node.rating = temp_rating
  end

  def find_parent(root, parent)  # breadth first seach - returns parent (or nil)
    if parent == root
      return nil
    end

    queue = Queue.new
    queue.enq(@root)
    while queue.size > 0
      var = queue.deq
      if var.left == parent || var.right == parent
        return var  # parent found!
      end
      queue.enq(var.left) if var.left != nil
      queue.enq(var.right) if var.right != nil
    end
    return nil
  end

  def lowest_child(node)  # returns lowest rated child or nil
    if node.left == nil && node.right == nil
      return nil
    elsif node.left == nil
      return node.right
    elsif node.right == nil
      return node.left
    else
      node.left.rating < node.right.rating ? node.left : node.right
    end
  end

end
