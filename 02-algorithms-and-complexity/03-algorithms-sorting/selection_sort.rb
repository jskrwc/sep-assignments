def selection_sort(collection)
  length = collection.length
  # #1
  for i in 0..length - 2
    # #2
    min_index = i
    # #3
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        # #4
        min_index = j
      end
    end

    # #5
    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp
  end
  collection
end
