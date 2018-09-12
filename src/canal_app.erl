-module(canal_app).
-include("canal_internal.hrl").

-export([
    start/0,
    stop/0
]).

-behaviour(application).
-export([
    start/2,
    stop/1
]).


%% public

-spec start() -> {ok, [atom()]}.

start() ->
    application:ensure_all_started(?APP).


-spec stop() -> ok | {error, {not_started, ?APP}}.

stop() ->
    application:stop(?APP).


%% callbacks

-spec start(application:start_type(), term()) -> {ok, pid()}.

start(_StartType, _StartArgs) ->
    canal_sup:start_link().


-spec stop(term()) -> ok.

stop(_State) -> ok.
