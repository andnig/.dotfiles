#!/usr/bin/env bash

# Set fzf path based on OS
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS - use just 'fzf'
  FZF_CMD="fzf"
else
  # Linux - use the full path
  FZF_CMD="$HOME/.fzf/bin/fzf"
fi
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

selected=$(cat "$DIR/tmux-cht-languages" "$DIR/tmux-cht-commands" | $FZF_CMD)
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" "$DIR/tmux-cht-languages"; then
  query=$(echo $query | tr ' ' '+')
  tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
