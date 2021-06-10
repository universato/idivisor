require "idivisor/version"

class Integer
  # Rails Active::Support.
  #   0.multiple_of?(0)  # => true
  #   6.multiple_of?(5)  # => false
  #   10.multiple_of?(2) # => true
  def multiple_of?(other)
    other == 0 ? self == 0 : self % other == 0
  end

  # Returns +true+ if other integer is a divisor of self integer.
  #   15.divisible_by?(5) #=> true
  #   15.divisible_by?(4) #=> false
  def divisible_by?(other)
    self % other == 0
  end
  alias has_divisor? divisible_by?

  # Returns +true+ if self integer is a divisor of other integer.
  #   5.divisor_of?(15) #=> true
  #   4.divisor_of?(15) #=> false
  def divisor_of?(other)
    other % self == 0
  end

  # Returns an array of the divisors of the integer.
  #    1.divisors #=> [1]
  #    2.divisors #=> [1, 2]
  #    3.divisors #=> [1, 3]
  #    4.divisors #=> [1, 2, 4]
  #   15.divisors #=> [1, 3, 5, 15]
  #   16.divisors #=> [1, 2, 4, 8, 16]
  def divisors
    n = self # .abs
    s = Integer.sqrt(n)
    res1 = []
    res2 = []
    (1..s).each do |i|
      if self % i == 0
        res1 << i
        res2.unshift(n / i)
      end
    end
    res1.pop if s * s == n
    res1.concat(res2)
  end

  # list positive divisors from positive integer.
  #   4.each_divisor do |i|
  #     puts i
  #   end
  def each_divisor
    return enum_for(:each_divisor) unless block_given?

    s = Integer.sqrt(self)
    big_divisors = []
    i = 1
    while i <= s
      if self % i == 0
        yield(i)
        big_divisors.unshift(self / i)
      end
      i += 1
    end
    big_divisors.shift if s * s == self
    big_divisors.each{ |d| yield(d) }
    nil
  end
end
