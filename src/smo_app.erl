-module(smo_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    smo:start().

stop(_State) ->
    smo:stop().
