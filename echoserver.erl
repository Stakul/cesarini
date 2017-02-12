%%Exercise 4.1 of Cesarini, Erlang Programming
-module(echoserver).
-export([start/0,print/1,stop/0]).

start()->
    register(echo, spawn(echoserver,loop,[])).

print(Term)->
    echo ! Term.

stop()->
    echo ! stop.

loop() ->
  receive
    stop -> true;
    Msg -> io:format("~w~n", [Msg]),
    loop()
  end,
  ok.
