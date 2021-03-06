# Idivisor

list divisors for a integer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idivisor'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install idivisor

## Usage

```rb
require 'idivisor'

p 100.divisors          #=> [1, 2, 4, 5, 10, 20, 25, 50, 100]
p 100.each_diviror.to_a #=> [1, 2, 4, 5, 10, 20, 25, 50, 100]

# `has_divisor?` and `divisible_by?` are same for alias.
p 4.has_divisor?(2) #=> true
p 4.divisible_by?(3) #=> false

# 3 is a divisor of 9.
# 4 is not a divisor of 2
p 3.divisor_of?(9) #=> true
p 4.divisor_of?(2) #=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### test

```bash
$ rake test
$ rake
$ ruby test/idivisor_test.rb`
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/universato/idivisor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/universato/idivisor/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the CC0 License.

## Code of Conduct

Everyone interacting in the Divisor project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/universato/divisor/blob/master/CODE_OF_CONDUCT.md).
