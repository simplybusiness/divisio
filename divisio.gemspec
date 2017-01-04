# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'divisio/version'

Gem::Specification.new do |spec|
  spec.name          = 'divisio'
  spec.version       = Divisio::VERSION
  spec.authors       = ['Dragos Miron']
  spec.email         = ['tech@simplybusiness.co.uk']
  spec.summary       = %q{Provides a splitting framework similar to AB testing}
  spec.description   = %q{Provides a splitting framework similar to AB testing}
  spec.homepage      = 'http://www.simplybusiness.co.uk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'mongoid', '~> 6.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.46'
end
