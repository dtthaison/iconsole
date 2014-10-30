# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iconsole/version'

Gem::Specification.new do |spec|
  spec.name          = "iconsole"
  spec.version       = Iconsole::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["dtthaison"]
  spec.email         = "dtthaison@gmail.com"
  spec.summary       = "Debug tool"
  spec.description   = "Debug tool"
  spec.homepage      = "https://github.com/dtthaison/iconsole"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "rails", ">= 3.2"
  spec.add_dependency "awesome_print"
end
