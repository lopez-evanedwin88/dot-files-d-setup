#!/bin/bash
# Create a new tmux session named 'workspace'
tmux new-session -d -s workspace 'zsh'  # First window with Zsh (named 'workspace')
# Rename the first window to 'workspace'
tmux rename-window 'workspace'  # Rename the first window
# Create a second window named 'cmd' running Zsh
tmux new-window -t workspace:1 'zsh'  # Second window
tmux rename-window 'cmd'  # Rename the second window to 'cmd'
# Attach to the session
tmux attach -t workspace  # Attach to the session
