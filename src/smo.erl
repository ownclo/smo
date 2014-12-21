-module(smo).
-export([start/0,
         stop/0]).

start() ->
    Pid = smo_worker:start(self()),
    lager:info("Worker ~p started.", [Pid]),
    loop(Pid).

loop(Pid) ->
    receive
        {Pid, hundred} ->
            lager:info("Worker ~p handled 100 tasks", [Pid])
    end,
    loop(Pid).

stop() ->
    ok.
