# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rrdiff}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Abhi Yerra"]
  s.description = %q{Ruby bindings to librsync which provides rdiff.}
  s.email = %q{ykabhinav@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.files = ["ext/rrdiff.c", "rrdiff_config.h", "ext/librsync.h", "ext/librsync-config.h"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/abhiyerra/rrdiff}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Ruby bindings to librsync which provides rdiff.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
  end
end

