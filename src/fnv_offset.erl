-module(fnv_offset).

-export([hash/1]).

-define(OFFSET_BASIS, 2166136261).
-define(FNV_PRIME, 16777619).

hash(Term) when is_binary(Term) ->
  fnv_int(?OFFSET_BASIS, 0, Term);

hash(Term) ->
  fnv_int(?OFFSET_BASIS, 0, term_to_binary(Term)).

fnv_int(Hash, ByteOffset, Bin) when erlang:byte_size(Bin) == ByteOffset ->
  Hash;

fnv_int(Hash, ByteOffset, Bin) ->
  <<_:ByteOffset/binary, Octet:8, _/binary>> = Bin,
  Xord = Hash bxor Octet,
  fnv_int((Xord * ?FNV_PRIME) rem (2 bsl 31), ByteOffset+1, Bin).
