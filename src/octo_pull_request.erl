%% octo_pull_request: The handler for pull requests.

-module(octo_pull_request).
-include("octo.hrl").
-export([list/3, read/4, list_commits/4, list_files/4]).

%% API

list(Owner, Repo, Options) ->
  PullRequests = octo_helper:read_collection(pull_request, [Owner, Repo], Options),
  Result       = [ ?struct_to_record(octo_pull_request, PullRequest) || (PullRequest) <- PullRequests ],
  {ok, Result}.

read(Owner, Repo, Number, Options) ->
  Url    = octo_helper:get_pull_request_url(Owner, Repo, Number),
  Json   = octo_helper:get(Url, Options),
  Result = ?json_to_record(octo_pull_request, Json),
  {ok, Result}.


list_commits(Owner, Repo, Number, Options) ->
  Commits = octo_helper:read_collection(pull_request_commits, [Owner, Repo, Number], Options),
  Result  = [ ?struct_to_record(octo_commit, Commit) || (Commit) <- Commits ],
  {ok, Result}.

list_files(Owner, Repo, Number, Options) ->
  Files  = octo_helper:read_collection(pull_request_files, [Owner, Repo, Number], Options),
  Result = [ ?struct_to_record(octo_file, File) || (File) <- Files ],
  {ok, Result}.