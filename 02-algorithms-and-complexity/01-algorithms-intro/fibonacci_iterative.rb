def fib(n)

  return 0 if n == 0     # needed bc fib(0) = 0
  # return 1 if n == 1

  fib_0 = 0
  fib_1 = 1

  (0..n-2).each do       # can correct by using n-2, fixes fib(1) as well
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end

  fib_1

end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
