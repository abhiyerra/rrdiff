require 'rubygems'
require 'rake/clean'
require 'rspec/core/rake_task'

NAME = 'rrdiff'

# rule to build the extension: this says
# that the extension should be rebuilt
# after any change to the files in ext
file "lib/#{NAME}/#{NAME}.#{RbConfig::CONFIG['DLEXT']}" => Dir.glob("ext/#{NAME}/*{.rb,.c}") do
  Dir.chdir("ext/#{NAME}") do
    # this does essentially the same thing
    # as what RubyGems does
    ruby "extconf.rb"
    sh "make"
  end
end

CLEAN.include('ext/**/*{.o,.log,.so,.bundle}')
CLEAN.include('ext/**/Makefile')
CLOBBER.include('lib/**/*.so')

RSpec::Core::RakeTask.new(:spec)
task :default => ["lib/#{NAME}/#{NAME}.#{RbConfig::CONFIG['DLEXT']}", :spec]
