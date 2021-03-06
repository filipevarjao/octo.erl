-record(octo_pull_request, {
  id,
  url,
  html_url,
  diff_url,
  patch_url,
  issue_url,
  commits_url,
  review_comments_url,
  review_comment_url,
  comments_url,
  statuses_url,
  number,
  state,
  title,
  body,
  created_at,
  updated_at,
  closed_at,
  merged_at,
  head,
  base,
  '_links',
  user,
  locked,
  merge_commit_sha,
  assignee,
  milestone,
  merged,
  mergeable,
  mergeable_state,
  merged_by,
  comments,
  review_comments,
  commits,
  additions,
  deletions,
  changed_files
}).

-record(octo_pull_request_merge, {
  sha,
  merged,
  message
}).
