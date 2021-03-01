require_relative 'lib/idivisor/version'

Gem::Specification.new do |spec|
  spec.name          = "idivisor"
  spec.version       = Idivisor::VERSION
  spec.authors       = ["universato"]
  spec.email         = ["universato@gmail.com"]

  spec.summary       = "divisor"
  spec.description   = "divisors, each_divisor, has_divisor?, divisor_of?"
  spec.homepage      = "https://github.com/universato/idivisor"
  spec.license       = "CC0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/universato/idivisor"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
