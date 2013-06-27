# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "RRDiff"
  s.version = "0.10.0"

  s.authors = ["Abhi Yerra"]
  s.email = %q{ykabhinav@gmail.com}

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')

  s.description = %q{Ruby bindings to librsync which provides rdiff.}
  s.summary = %q{Ruby bindings to librsync which provides rdiff.}
  s.homepage = %q{http://github.com/abhiyerra/rrdiff}

  s.extensions = ["ext/rrdiff/extconf.rb"]

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end
