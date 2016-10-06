# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'hako-gcredstash'
  spec.version       = '0.1.0'
  spec.authors       = ['Shinya Watanabe']
  spec.email         = ['wata-gh@gmail.com']

  spec.summary       = 'Provide variables from gcredstash to hako'
  spec.description   = 'Provide variables from gcredstash to hako'
  spec.homepage      = 'https://github.com/wata-gh/hako-gcredstash'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
