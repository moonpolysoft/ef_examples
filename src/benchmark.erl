-module(benchmark).

-export([time/1, time/2]).

time(Fun) ->
  Start = -now_float(),
  Result = Fun(),
  Elapsed = Start + now_float(),
  {Result, Elapsed}.
  
time(Fun, Times) ->
  Start = -now_float(),
  Result = run(Fun, Times),
  Elapsed = Start + now_float(),
  {Result, Elapsed}.

run(Fun, 1) ->
  Fun();
run(Fun, Times) ->
  Fun(),
  run(Fun, Times-1).

now_float() ->
  time_to_epoch_float(now()).
  
time_to_epoch_float(Time) when is_integer(Time) or is_float(Time) ->
  Time;

time_to_epoch_float({Mega,Sec,Micro}) ->
  Mega * 1000000 + Sec + Micro / 1000000.
