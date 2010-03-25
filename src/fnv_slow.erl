-module(fnv_slow).

-export([hash/1]).

-define(OFFSET_BASIS, 2166136261).
-define(FNV_PRIME, 16777619).

hash(Term) when is_binary(Term) ->
  fnv_int(?OFFSET_BASIS, Term);

hash(Term) ->
  fnv_int(?OFFSET_BASIS, term_to_binary(Term)).

fnv_int(Hash, <<>>) ->
  Hash;
fnv_int(Hash, <<Byte:8, Tail/binary>>) ->
  Xord = ((Hash bxor Byte) * ?FNV_PRIME) bor (2 bsl 31),
  fnv_int(Xord rem (2 bsl 31), Tail).
