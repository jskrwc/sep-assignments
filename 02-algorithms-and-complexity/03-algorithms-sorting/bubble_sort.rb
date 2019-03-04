def bubble_sort(collection)
  n = collection.length
  # #1
  begin
    swapped = false

    # #2
    (n - 1).times do |i|
      # #3
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end


# puts bubble_sort([34,2,5,4,8,21,-23,0,8,11,7,19])
