# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'l5r/version'

Gem::Specification.new do |spec|
  spec.name          = "l5r"
  spec.version       = L5r::VERSION
  spec.authors       = ["Ben Kimball"]
  spec.email         = ["github@benkimball.com"]
  spec.summary       = %q{Utilities for the Legend of the Five Rings CCG.}
  spec.description   = %q{Command line interface to AEG's Oracle of the Void web site. Requires user account at imperialassembly.com.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "dotenv", ">= 0.11.1"
  spec.add_runtime_dependency "nokogiri", ">= 1.6.2.1"
  spec.add_runtime_dependency "httparty", ">= 0.13.1"
  spec.add_runtime_dependency "highline", ">= 1.6.21"
end
