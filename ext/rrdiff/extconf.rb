require 'mkmf'

fail unless have_library('rsync')
have_header('librsync.h')

create_makefile('rrdiff/rrdiff')
