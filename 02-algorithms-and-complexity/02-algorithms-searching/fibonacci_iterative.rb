def fib_i(n)

  return 0 if n == 0     # needed bc fib(0) = 0***

  fib_0 = 0
  fib_1 = 1

  (0..n-2).each do       # can correct by using n-2, fixes fib(1) as well
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end

  fib_1

end



## ***  NOTE most fibonacci code examples start from 1, so 1,1,2,...
# here starting from base case zero
