#include <ruby.h>
#include <stdio.h>
#include <stdlib.h>
#include <librsync.h>

VALUE RRDiff = Qnil;

static VALUE rrdiff_signature(VALUE mod, VALUE old_file, VALUE sig_file)
{
    FILE *basis, *signature;

    rs_result result;
    rs_stats_t stats;
  
    basis = rs_file_open(StringValuePtr(old_file), "rb");
    signature = rs_file_open(StringValuePtr(sig_file), "wb");

    result = rs_sig_file(basis, signature, RS_DEFAULT_BLOCK_LEN, RS_DEFAULT_STRONG_LEN, &stats);

    rs_file_close(basis);
    rs_file_close(signature);

    return Qnil;
}


static VALUE rrdiff_delta(VALUE mod, VALUE new_file, VALUE sig_file, VALUE delta_file)
{
    FILE *newfile, *sigfile, *deltafile;

    rs_result result;
    rs_stats_t stats;
    rs_signature_t *sig;

    newfile = rs_file_open(StringValuePtr(new_file), "rb");
    sigfile = rs_file_open(StringValuePtr(sig_file), "rb");
    deltafile = rs_file_open(StringValuePtr(delta_file), "wb");

    if((result = rs_loadsig_file(sigfile, &sig, &stats)) != RS_DONE)
        return Qnil;

    if ((result = rs_build_hash_table(sig)) != RS_DONE)
        return Qnil;

    result = rs_delta_file(sig, newfile, deltafile, &stats);
    
    rs_free_sumset(sig);

    rs_file_close(newfile);
    rs_file_close(sigfile);
    rs_file_close(deltafile);

    return Qnil;
}

//rs_result rs_patch_file(FILE *basis_file, FILE *delta_file, FILE *new_file, rs_stats_t *); 

static VALUE rrdiff_patch(VALUE mod, VALUE old_file, VALUE delta_file, VALUE patched_file)
{
    FILE *basisfile, *deltafile, *newfile;

    rs_stats_t stats;
    rs_result result;

    basisfile = rs_file_open(StringValuePtr(old_file), "rb");
    deltafile = rs_file_open(StringValuePtr(delta_file), "rb");
    newfile = rs_file_open(StringValuePtr(patched_file), "wb");

    result = rs_patch_file(basisfile, deltafile, newfile, &stats);

    rs_file_close(newfile);
    rs_file_close(deltafile);
    rs_file_close(basisfile);

    return Qnil;
}

/* main entry point */
void Init_RRDiff()
{
    RRDiff = rb_define_module("RRDiff");

    rb_define_singleton_method(RRDiff, "signature", rrdiff_signature, 2);
    rb_define_singleton_method(RRDiff, "delta", rrdiff_delta, 3);
    rb_define_singleton_method(RRDiff, "patch", rrdiff_patch, 3);
}
