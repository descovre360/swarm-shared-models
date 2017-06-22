# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swarm_shared_models'

Gem::Specification.new do |spec|
  spec.name          = "swarm-shared-models"
  spec.version       = SwarmSharedModels::VERSION
  spec.authors       = ["inno360 dev"]
  spec.email         = ["dev@inno-360.com"]

  spec.summary       = %q{The shared RoR models and migrations used by the Next Gen application.}
  spec.homepage      = "https://github.com/inno360/swarm-shared-models"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_dependency("rails", "5.0.0.1")
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
