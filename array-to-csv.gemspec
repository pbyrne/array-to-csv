SPEC = Gem::Specification.new do |s|
  s.name = "array-to-csv"
  s.version = "1.0.1"
  s.author = "Patrick Byrne"
  s.email = "code@patrickbyrne.net"
  s.homepage = "http://github.com/pbyrne/array-to-csv/"
  s.summary = "Adds Array#to_csv method that converts the contents of the array to CSV format."
  s.platform = Gem::Platform::RUBY
  s.files = ["lib/array-to-csv.rb"]
  s.require_path = "lib"
  s.test_file = "spec/array-to-csv_spec.rb"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
end
