# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = arrays.flatten

  # Selection sort the combined array  -- better space complexity than merge_sort
  length = combined_array.length
  for i in 0..length - 2
    min_index = i

    for j in (i + 1)...length
      if combined_array[j] < combined_array[min_index]
        min_index = j
      end
    end

    tmp = combined_array[i]
    combined_array[i] = combined_array[min_index]
    combined_array[min_index] = tmp
  end
  combined_array
end


# p poorly_written_ruby([2,3,1],[9,3,5,8],[4,0])
