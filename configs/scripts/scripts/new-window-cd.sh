#!/bin/bash

create_tmux_window() {
  # Set fzf path based on OS
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS - use just 'fzf'
    FZF_CMD="fzf"
  else
    # Linux - use the full path
    FZF_CMD="$HOME/.fzf/bin/fzf"
  fi
  # Capture the output from the find command piped to fzf
  selected_dir=$(find ~/github ~/ ~/.dotfiles -mindepth 1 -maxdepth 3 -type d 2>/dev/null | $FZF_CMD)

  # Check if the selection is non-empty
  if [[ -n "$selected_dir" ]]; then
    # Extract the basename of the selected directory
    window_name=$(basename "$selected_dir")

    # Create a new tmux window with the selected directory basename as the window name
    # and cd into the selected directory
    tmux new-window -n "$window_name" "cd \"$selected_dir\"; exec zsh"
  else
    echo "No directory selected."
  fi
}

create_tmux_window
