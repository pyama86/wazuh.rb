# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wazuh/version'

Gem::Specification.new do |spec|
  spec.name          = "wazuh-rb"
  spec.version       = Wazuh::VERSION
  spec.authors       = ["pyama86"]
  spec.email         = ["www.kazu.com@gmail.com"]

  spec.summary       = %q{Wazuh client for Ruby.}
  spec.description   = %q{Wazuh client for Ruby.}
  spec.homepage      = "https://github.com/pyama86/wazuh.rb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
