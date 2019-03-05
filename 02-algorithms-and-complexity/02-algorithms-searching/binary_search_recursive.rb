def binary_search_recursive(target, array, low=0, high=array.length-1)

  if low > high  #base case, not found
    return -1
  end

  mid = (low + high)/2

  if array[mid] == target       # if element is present at the mid itself
    return mid
  elsif array[mid] > target   # target smaller, so in left subarray
    return binary_search_recursive(target, array, low, mid-1)
  else                        # target larger, so in right subarray
    return binary_search_recursive(target, array, mid+1, high)
  end

end





# puts binary_search_recursive(4,[1,2,3,4,5,6,7,8,9,10])
# puts binary_search_recursive(4,[1,2,3,4,5,6,7,8,9,10,11])
# puts binary_search_recursive(2,[2])
# puts binary_search_recursive(5,[1,2,3,4,6,7,8,9,10,11])
# puts binary_search_recursive(25,[1,2,3,4,6,7,8,9,10,11])
