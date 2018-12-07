require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
llist = LinkedList.new

# Benchmark creation of array; creation of linked list
Benchmark.bm do |x|
  x.report("create array(.new): ") { Array.new(n,"aDummy") }
  x.report("create array(for): ") { for i in 1..n do; array[i] = "aDummy"; end }
  x.report("create linked-list: ") { for i in 1..n do; llist.add_to_tail(Node.new("nDummy")); end }
end

# Benchmark - accessing the 5000th element of array v.  linked list

#create a linked list -- with a marked 5000th element
llist2 = LinkedList.new
node_flag = Node.new("flag")
4999.times { llist2.add_to_tail(Node.new("dummy")) }
llist2.add_to_tail(node_flag)
5000.times { llist2.add_to_tail(Node.new("dummy")) }

Benchmark.bm do |x|
  x.report("retrieve 5000th array element: ") { array[4999] }
  x.report("retrieve 5000th linked list element: ") { llist2.find("flag") }
end

# Benchmark remove 5000th element array v. linked list
Benchmark.bm do |x|
  x.report("remove 5000th element array: ") {array.delete_at(4999)}
  x.report("remove 5000th element list: ") { llist2.delete(llist2.find("flag")) }
end


#   on replit     https://repl.it/@jskrwc/sep-assignments03-linkedlistsbenchmarks
