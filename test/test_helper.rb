$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "simplecov"
SimpleCov.start

require "idivisor"
require "minitest/autorun"
