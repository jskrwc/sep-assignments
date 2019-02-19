require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_heap/min_heap'



tree_root = Node.new("tree root", 50)
heap_root = Node.new("heap root" , 50)
tree = BinarySearchTree.new(tree_root)
heap = MinHeapTree.new(heap_root)

n = 100000

Benchmark.bm(25) do |x|       # INSERT
  x.report("Tree Insert") do
    for i in 1..n do
      node = Node.new("tree", Random.rand(n))
      tree.insert(tree_root, node)
    end
  end
  x.report("Heap Insert") do
    for i in 1..n do
      node = Node.new("heap", Random.rand(n))
      heap.insert(heap_root, node)
    end
  end
end

target = Node.new("target", n/2)
tree.insert(tree_root, target)
heap.insert(heap_root, target)

Benchmark.bm(25) do |x|       # FIND
  x.report("Tree Find") do
    tree.find(tree_root, n/2)
  end
  x.report("Heap Find") do
    heap.find(heap_root, n/2)
  end
end


Benchmark.bm(25) do |x|       # DELETE
  x.report("Tree Delete") do
    tree.delete(tree_root, n/2)
  end
  x.report("Heap Delete") do
    heap.delete(heap_root, n/2)
  end
end
