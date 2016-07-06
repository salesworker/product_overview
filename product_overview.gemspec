# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'product_overview/version'

Gem::Specification.new do |spec|
  spec.name          = "product_overview"
  spec.version       = ProductOverview::VERSION
  spec.authors       = ["Alex Kholodniak"]
  spec.email         = ["alexandrkholodniak@gmail.com"]

  spec.summary       = %q{Product overview gem.}
  spec.description   = %q{Product overview gem.}
  spec.homepage      = "https://github.com/salesworker/product_overview"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "facets", "~> 3.0"
  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency "faraday_middleware", "~> 0.9.1"
  spec.add_development_dependency "rake",  "~> 11.1"
end
