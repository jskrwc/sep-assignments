def quick_sort(collection)

  return collection if collection.length <= 1

  pivot = collection.length - 1   # index of the pivot point

  left = []
  right = []
  result = []

  # (collection.length-1).times do |i|  # or just pivot times do
  pivot.times do |i|
    if collection[i] >= collection[pivot]
      right << collection[i]
    else
      left << collection[i]
    end
  end

  result = quick_sort(left), collection[pivot], quick_sort(right)
  result = result.flatten
  return result

end


# puts quick_sort([5,3,6,1,2,4])
# puts quick_sort([23,-4,5,-5,9,10,2,0])
# puts "empty #{quick_sort([])}"
