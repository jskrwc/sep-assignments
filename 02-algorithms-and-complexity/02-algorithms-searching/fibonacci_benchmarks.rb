require 'benchmark'

require_relative 'fibonacci_recursive'
require_relative 'fibonacci_iterative'

Benchmark.bmbm do |test|
  test.report("recursive 20") {fib(20)}
  test.report("iterative 20") {fib_i(20)}

  test.report("recursive 40") {fib(40)}
  test.report("iterative 40") {fib_i(40)}
end
