def binary_search_iterative(target, array)
  low = 0
  high = array.length - 1

  while low <= high do
    mid = (low + high) / 2      # nb index will truncate to integer e.g. 2.5 = 2
     if target < array[mid]
      high = mid - 1
    elsif target > array[mid]
      low = mid + 1
    else
      return mid
    end
  end

  return -1  # no joy

end

# puts binary_search_iterative(4,[1,2,3,4,5,6,7,8,9,10])
# puts binary_search_iterative(4,[1,2,3,4,5,6,7,8,9,10,11])
# puts binary_search_iterative(21,[1,2,3,4,5,6,7,8,9,10,11])
