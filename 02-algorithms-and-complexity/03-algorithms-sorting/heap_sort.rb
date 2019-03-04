def heap_sort(collection)

  # build max heap
  build_max_heap(collection)

  # find last element index
  last_element = collection.length - 1

  # continue heap sorting unitl have just one element left in the array
  while last_element > 0 do
    swap(collection, 0, last_element)
    heapify(collection, 0, last_element)
    last_element = last_element - 1
  end

  return collection
end


def build_max_heap(collection)
  i = (collection.length/2 -1).floor         # ruby truncates a fractional index

  # build a max heap out of all array elements passed in
  while i >= 0 do
    heapify(collection, i, collection.length)
    i = i - 1
  end
end


def heapify(heap, i, max)  # moves one element at a time down to correct location in heap

  while i < max do
    index = i
    left_child = 2*i + 1
    right_child = left_child + 1

    if left_child < max && heap[left_child] > heap[index]
      index = left_child
    end

    if right_child < max && heap[right_child] > heap[index]
      index = right_child
    end

    if index == i  ##
      return i
    end

    swap(heap, i, index)
    i = index
  end
end


def swap(array, first, last)
  temp = array[first]
  array[first] = array[last]
  array[last] = temp
  return array
end

# puts heap_sort([3,5,1,7,-2,-22,2,6])
