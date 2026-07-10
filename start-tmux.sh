#!/bin/bash

# Ensure the 'prod' session exists
if ! tmux has-session -t homerinthebushes 2>/dev/null; then
  # Create a new session named 'prod', detached
  cd /workspaces/homerinthebushes
  tmux new-session -d -s homerinthebushes
fi
