-module(smo_worker).
-export([start/1,
         stop/0]).

start(Master) ->
    erlang:spawn(fun() -> loop(Master, 0) end).

loop(Master, N) ->
    {A, B, C} = erlang:now(),
    random:seed(A,B,C),
    I = random:uniform(2),
    case I of
        1 -> timer:sleep(50);
        2 -> timer:sleep(100)
    end,
    case N =:= 100 of
        true ->
            Master ! {self(), hundred},
            loop(Master, 0);
        false ->
            loop(Master, N+1)
    end.

stop() ->
    ok.
