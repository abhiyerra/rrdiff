require 'rubygems'
require 'rake/clean'
require 'spec/rake/spectask'
require 'spec/ruby'

CLEAN.include '**/*.o'
CLEAN.include "**/*.#{Config::MAKEFILE_CONFIG['DLEXT']}"
CLOBBER.include '**/Makefile'
CLOBBER.include '**/bsdiff_config.h'
CLOBBER.include '**/mkmf.log'

BSDIFF_SO = "ext/bsdiff.#{Config::MAKEFILE_CONFIG['DLEXT']}"

MAKECMD = ENV['MAKE_CMD'] || 'make'
MAKEOPTS = ENV['MAKE_OPTS'] || ''

desc "Test project"
task :default => ['compile', 'test']

file 'ext/Makefile' => 'ext/extconf.rb' do
  Dir.chdir('ext') do
    ruby "extconf.rb #{ENV['EXTCONF_OPTS']}"
  end
end

# Let make handle dependencies between c/o/so - we'll just run it.
file BSDIFF_SO => (['ext/Makefile'] + Dir['ext/*.c'] + Dir['ext/*.h']) do
  m = 0
  Dir.chdir('ext') do
    pid = system("#{MAKECMD} #{MAKEOPTS}")
    m = $?.exitstatus
  end
  fail "Make failed (status #{m})" unless m == 0
end

desc "Compile the shared object"
task :compile => [BSDIFF_SO]

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['test/*.rb']
end
