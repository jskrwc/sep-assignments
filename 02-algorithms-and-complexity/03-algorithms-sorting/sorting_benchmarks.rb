require 'benchmark'
require_relative 'bubble_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'selection_sort'


# create randomly sorted array
def generate_collection(array)
  array =[]
  50.times do |n|
    array << n + 1
  end
  return array.shuffle
end

test_array = generate_collection([])


Benchmark.bm(25) do |test|

  test.report("bubble_sort") { bubble_sort(test_array) }
  test.report("bucket_sort") { bucket_sort(test_array) }
  test.report("heap_sort") { heap_sort(test_array) }
  test.report("insertion_sort") { insertion_sort(test_array) }
  test.report("merge_sort") { merge_sort(test_array) }
  test.report("quick_sort") { quick_sort(test_array) }
  test.report("selection_sort") { selection_sort(test_array) }
end
