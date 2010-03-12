-module(ef_bench).

-export([run/0]).

run() ->
  Bin = list_to_binary(lists:map(fun(N) -> N rem 255 end, lists:seq(0,10000000))),
  fnv_nif:init(),
  R1 = benchmark:time(fun() -> fnv_nif:hash(Bin) end),
  io:format("nif: ~p~n", [R1]),
  R2 = benchmark:time(fun() -> fnv_slow:hash(Bin) end),
  io:format("slow: ~p~n", [R2]),
  R3 = benchmark:time(fun() -> fnv_terrible:hash(Bin) end),
  io:format("terrible: ~p~n", [R3]).
