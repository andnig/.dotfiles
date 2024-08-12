#!/bin/bash

# Function to create a new tmux window, ssh to a host, and run commands
create_window_and_run_commands() {
  local host=$1
  local window_name=$(echo $host | sed 's/\./_/g')

  # Create a new tmux window
  tmux new-window -n "$window_name"

  # Send commands to the new window
  tmux send-keys "ssh $host" C-m
  tmux send-keys "echo 'Drives more than 80% full and at least 275 MB in size:'" C-m
  tmux send-keys "df -BM | awk 'NR>1 && int(\$2) >= 275 && int(\$5) > 80 {print \$0}'" C-m
  tmux send-keys "echo ''" C-m
  tmux send-keys "echo 'Docker services below target replicas:'" C-m
  tmux send-keys "docker service ls --format '{{.ID}}\t{{.Name}}\t{{.Mode}}\t{{.Replicas}}' | awk -F'\t' '{split(\$4, a, \"/\"); if (a[1] < a[2]) print \$0}'" C-m
  tmux send-keys "echo ''" C-m
}

# Check if we're in a tmux session
if [ -z "$TMUX" ]; then
  echo "Please run this script from within a tmux session."
  exit 1
fi

# List of hosts
hosts=("mt.db1" "mt.compute1" "engie.db1" "emco.db1" "emco.compute1")

# Create a window for each host
for host in "${hosts[@]}"; do
  create_window_and_run_commands "$host"
done
