# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack_strip_client_ip/version'

Gem::Specification.new do |spec|
  spec.name          = "rack_strip_client_ip"
  spec.version       = RackStripClientIp::VERSION
  spec.authors       = ["Alex Tomlins"]
  spec.email         = ["alex@tomlins.org.uk"]
  spec.description   = %q{rack middleware to remote Client-IP headers.  This is to prevent IpSpoofAttackErrors in a Rails app}
  spec.summary       = %q{rack middleware to remote Client-IP headers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
