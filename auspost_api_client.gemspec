# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "auspost_api_client/version"

Gem::Specification.new do |spec|
  spec.name          = "auspost_api_client"
  spec.version       = AuspostApiClient::VERSION
  spec.authors       = ["Luke Picciau"]
  spec.email         = ["lukepicciau@bravevision.com"]

  spec.summary       = "API client for Australia Post"
  spec.description   = "API client for Australia Post"
  spec.homepage      = "https://gitlab.com/bravevision/auspost_api_client"
  spec.license       = "MIT"


  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.0.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
