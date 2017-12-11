# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ratsel/version"

Gem::Specification.new do |spec|
  spec.name          = "ratsel"
  spec.version       = Ratsel::VERSION
  spec.authors       = ["Vanessa Ejikeme"]
  spec.email         = ["vanessa.ejikeme@gmail.com"]

  spec.summary       = "An encryption engine"
  spec.description   = "Ratsel is used in encryption and decrypting text from a file."
  spec.homepage      = "https://github.com/vynessa/ratsel"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = %w(encrypt decrypt crack)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls", '~> 0'
  spec.add_development_dependency "simplecov", '~> 0'
end
