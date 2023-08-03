# solver.rb

class Solver
    def factorial(n)
      raise ArgumentError, "Only accepts 0 and positive integers" if n.negative?
  
      return 1 if n.zero?
  
      result = 1
      (1..n).each { |i| result *= i }
      result
    end
  
    def reverse(word)
      word.reverse
    end
  
    def fizzbuzz(n)
      return "fizzbuzz" if (n % 3).zero? && (n % 5).zero?
      return "fizz" if (n % 3).zero?
      return "buzz" if (n % 5).zero?
  
      n.to_s
    end
  end
  