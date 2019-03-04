def worst_case_linear_iterations(n)
  output = Array.new(n)

  n.times do |i|
    max_iterations = i+1  # zero index
    output[i] = [i+1, max_iterations]
  end

# p output


  output.length.times do |ind|
    puts output[ind].join(',')
  end

  puts "end of data"

end

puts worst_case_linear_iterations(10)
