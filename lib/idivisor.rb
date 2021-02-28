require "idivisor/version"

class Integer
  def divisible_by?(num)
    self % num == 0
  end
  alias has_divisor? divisible_by?

  def divisor_of?(num)
    num % self == 0
  end

  # list positive divisors from positive integer.
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

  def each_divisor
    return enum_for(:each_divisor) unless block_given?

    s = Integer.sqrt(self)
    big_divisors = []
    (1..s).each do |i|
      if self % i == 0
        yield(i)
        big_divisors.unshift(self / i)
      end
    end
    big_divisors.shift if s * s == self
    big_divisors.each{ |d| yield(d) }
    nil
  end
end
