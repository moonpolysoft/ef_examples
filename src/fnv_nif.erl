-module(fnv_nif).

-on_load(init/0).

-define(SEED, 2166136261).

-export([init/0, hash/1, hash/2]).

init() ->
  erlang:load_nif("priv/ef_examples_drv",0).

hash(Bin) ->
  hash(Bin, ?SEED).

hash(Bin, Seed) ->
  io:format("nif not loaded derp!~n").