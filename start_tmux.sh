#!/bin/bash

# Set the session name to '~'
SESSION_NAME="|"

# Create a new tmux session named '~' and start with Zsh
tmux new-session -d -s "$SESSION_NAME" 'zsh'  # First window with Zsh

# Rename the first window to 'workspace'
tmux rename-window -t "$SESSION_NAME:0" 'workspace'  # Rename the first window

# Create a second window running Zsh
tmux new-window -t "$SESSION_NAME:1" 'zsh'  # Second window

# Rename the second window to 'cmd'
tmux rename-window -t "$SESSION_NAME:1" 'cmd'  # Rename the second window

# Attach to the session
tmux attach -t "$SESSION_NAME"  # Attach to the session
