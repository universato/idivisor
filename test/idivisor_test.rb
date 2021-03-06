require_relative "test_helper"

class IdivisorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Idivisor::VERSION
  end

  def test_method_divisors
    assert_equal [1], 1.divisors
    assert_equal [1, 2], 2.divisors
    assert_equal [1, 3], 3.divisors
    assert_equal [1, 2, 4], 4.divisors
    assert_equal [1, 2, 4, 5, 10, 20, 25, 50, 100], 100.divisors
  end

  def test_method_each_divisor_block
    divisors_of_100 = []
    100.each_divisor do |divisor|
      divisors_of_100 << divisor
    end
    assert_equal [1, 2, 4, 5, 10, 20, 25, 50, 100], divisors_of_100
  end

  def test_method_each_divisor_enumerator
    assert_equal [1], 1.each_divisor.to_a
    assert_equal [1, 2], 2.each_divisor.to_a
    assert_equal [1, 3], 3.each_divisor.to_a
    assert_equal [1, 2, 4], 4.each_divisor.to_a
    assert_equal [1, 2, 4, 5, 10, 20, 25, 50, 100], 100.each_divisor.to_a
  end

  def test_method_has_divisor?
    (-100..100).each{ |i| assert i.has_divisor?(1) }
    (1..100).each{ |i| assert 0.has_divisor?(i) }
    (1..100).each{ |i| assert i.has_divisor?(i) }

    assert 100.has_divisor?(2)
    refute 100.has_divisor?(3)
    refute 100.has_divisor?(200)

    assert(-100.has_divisor?(2))
    assert(-100.has_divisor?(-2))
    refute(-100.has_divisor?(3))
    refute(-100.has_divisor?(-3))
  end

  def test_method_divisible_by?
    (-100..100).each{ |i| assert i.divisible_by?(1) }
    (1..100).each{ |i| assert 0.divisible_by?(i) }
    (1..100).each{ |i| assert i.divisible_by?(i) }

    assert 100.divisible_by?(2)
    refute 100.divisible_by?(3)
    refute 100.divisible_by?(200)

    assert(-100.divisible_by?(2))
    assert(-100.divisible_by?(-2))
    refute(-100.divisible_by?(3))
    refute(-100.divisible_by?(-3))
  end

  def test_method_divisor_of?
    (-100..100).each{ |i| assert 1.divisor_of?(i) }
    (1..100).each{ |i| assert i.divisor_of?(0) }
    (1..100).each{ |i| assert i.divisor_of?(i) }

    assert 2.divisor_of?(2)
    refute 2.divisor_of?(3)

    assert 2.divisor_of?(0)
  end

  def test_method_multiple_of?
    assert 0.multiple_of?(0)
    refute 6.multiple_of?(5)
    assert 10.multiple_of?(2)

    (-100..100).each{ |i| assert i.multiple_of?(1) }
    (1..100).each{ |i| assert 0.multiple_of?(i) }
    (1..100).each{ |i| assert i.multiple_of?(i) }
    (1..100).each{ |i| refute i.multiple_of?(0) }

    assert 100.multiple_of?(2)
    refute 100.multiple_of?(3)
    refute 100.multiple_of?(200)

    assert(-100.multiple_of?(2))
    assert(-100.multiple_of?(-2))
    refute(-100.multiple_of?(3))
    refute(-100.multiple_of?(-3))
  end
end
