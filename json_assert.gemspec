# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "json_assert/version"

Gem::Specification.new do |s|
  s.name        = "json_assert"
  s.version     = JsonAssert::VERSION
  s.authors     = ["Frazer Horn"]
  s.email       = ["frazer.horn@gmail.com"]
  s.homepage    = "https://github.com/frazerh/json_assert"
  s.summary     = %q{Easily handle JSON in Test::Unit}
  s.description = %q{Easily handle JSON in Test::Unit}

  s.rubyforge_project = "json_assert"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "multi_json", "~> 1.0"
  s.add_development_dependency "rake", "~> 0.9"

end
