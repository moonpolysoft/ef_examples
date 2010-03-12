/* niftest.c */
#include <stdio.h>
#include "erl_nif.h"
#include "fnv.h"

static ERL_NIF_TERM hash(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
    ErlNifBinary bin;
    long seed;
    int hash;
    
    if (enif_inspect_binary(env, argv[0], &bin)) {
      int res = enif_get_long(env, argv[1], &seed);
      hash = fnv_hash(bin.data, bin.size, seed);
      return enif_make_int(env, hash);
    }
    return enif_make_atom(env, "badarg");
}
static ErlNifFunc nif_funcs[] = {
    {"hash", 2, hash}
};
ERL_NIF_INIT(fnv_nif,nif_funcs,NULL,NULL,NULL,NULL)