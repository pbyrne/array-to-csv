# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "array-to-csv/version"

Gem::Specification.new do |s|
  s.name        = "array-to-csv"
  s.version     = ArrayToCsv::VERSION
  s.authors     = ["Patrick Byrne"]
  s.email       = ["code@patrickbyrne.net"]
  s.homepage    = "https://github.com/pbyrne/array-to-csv/"
  s.summary     = %q{Adds Array#to_csv method that converts the contents of the array to CSV format.}
  s.description = %q{}
  s.platform = Gem::Platform::RUBY

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
