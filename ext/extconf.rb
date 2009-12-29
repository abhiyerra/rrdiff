require 'mkmf'

fail unless have_library('rsync')
create_header('rrdiff_config.h')
create_makefile('RRDiff')
