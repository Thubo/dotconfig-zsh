# Configure FZF Preview Window Settings
export FZF_PREVIEW_WINDOW='right:65%:nohidden'

# Search filenames in current dir
function fz()
{
  args=${@-"."}
  # args=$@
  vim -c "Files $args"
}

# Search content of files in current dir
function fzr()
{
  args=${@-"."}
  # args=$@
  vim -c "Rg $args"
}

# fd - cd to selected directory
function fzd()
{
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function fza()
{
  args=${@-"."}
  print -z $(alias | fzf --query="${args}" | cut -d "=" -f1)
}
