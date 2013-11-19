# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sort_hb_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "sort_hb_plugin"
  spec.version       = SortHbPlugin::VERSION
  spec.authors       = ["Charlie Greene"]
  spec.email         = ["greeneca@gmail.com"]
  spec.description   = %q{Variable sort content entries}
  spec.summary       = %q{Variable sort content entries}
  spec.homepage      = "http://colibri-software.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "locomotive_plugins", '~> 1.0.0.beta10'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
