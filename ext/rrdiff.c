#include <ruby.h>
#include <stdio.h>
#include <stdlib.h>
#include <librsync.h>

VALUE RRDiff = Qnil;

static VALUE rrdiff_signature(VALUE mod, VALUE old_file, VALUE sig_file)
{
  FILE *basis = fopen(StringValuePtr(old_file), "rb");
  FILE *signature = fopen(StringValuePtr(sig_file), "wb");

  rs_stats_t stats;

  return rs_sig_file(basis, signature, RS_DEFAULT_BLOCK_LEN, RS_DEFAULT_STRONG_LEN, &stats);
}

static VALUE rrdiff_delta(VALUE mod, VALUE oldfile, VALUE newfile, VALUE patchfile)
{
  if( bspatch_files(StringValuePtr(oldfile), StringValuePtr(newfile), StringValuePtr(patchfile)) ) {
    return Qfalse;
  }
  return Qtrue;
}

static VALUE rrdiff_patch(VALUE mod, VALUE oldfile, VALUE newfile, VALUE patchfile)
{
  if( bspatch_files(StringValuePtr(oldfile), StringValuePtr(newfile), StringValuePtr(patchfile)) ) {
    return Qfalse;
  }
  return Qtrue;
}

/* main entry point */
void Init_RRDiff()
{
  RRDiff = rb_define_module("RRDiff");

  rb_define_singleton_method(RRDiff, "signature", rrdiff_signature, 2);
 // rb_define_singleton_method(RRDiff, "patch", rrdiff_patch, 3);
}
