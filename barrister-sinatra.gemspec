# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barrister-sinatra/version'

Gem::Specification.new do |spec|
  spec.name          = "barrister-sinatra"
  spec.version       = Barrister::Sinatra::VERSION
  spec.authors       = ["Erin Swenson-Healey"]
  spec.email         = ["erin.swenson.healey@gmail.com"]
  spec.summary       = %q{A simple Sinatra server-container for Barrister.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'barrister', '~> 0'
  spec.add_dependency 'sinatra', '~> 1.4'
  spec.add_development_dependency 'pry'
end
