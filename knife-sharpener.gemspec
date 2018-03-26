# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife/sharpener/version'

Gem::Specification.new do |spec|
  spec.name          = 'knife-sharpener'
  spec.version       = Knife::Sharpener::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = %w('kigster@gmail.com)
  spec.description   = %q{Wrapper gem that generates knife provision commands for various clouds based on YAML templates}
  spec.summary       = %q{Wrapper gem that generates knife provision commands for various clouds based on YAML templates}
  spec.homepage      = 'https://github.com/kigster/knife-sharpener'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']


  spec.add_dependency 'mixlib-cli'
  spec.add_dependency 'hashie'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'aruba-doubles'

end
