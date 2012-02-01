# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "garnish/version"

Gem::Specification.new do |s|
  s.name        = "garnish"
  s.version     = Garnish::VERSION
  s.authors     = ["brianp"]
  s.email       = ["brian.o.pearce@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Provides the decorator design pattern}
  s.description = %q{Provides an easy to use and transparent system for implementing the Decorator Pattern}

  s.rubyforge_project = "garnish"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency "activesupport", '>= 3.0.0'
  s.add_development_dependency "rspec"
end
