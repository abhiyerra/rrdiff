require 'mkmf'

fail unless have_library('rsync')
have_header('librsync.h')
create_header('rrdiff_config.h')
create_makefile('rrdiff_ext')
