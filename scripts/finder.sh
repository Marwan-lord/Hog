#!/usr/bin/env bash

# Set your projects directory
PROJECTS_DIR="$HOME/Documents/projects/"  # Change this to your actual projects directory

# Use fzf to select a project
SELECTED_PROJECT=$(find "$PROJECTS_DIR" -mindepth 1 -maxdepth 1 -type d | fzf --height 40% --reverse --prompt="Select a project: ")

# Check if a project was selected
if [[ -z "$SELECTED_PROJECT" ]]; then
    echo "No project selected. Exiting."
    exit 1
fi

# Open the selected project in zellij
echo "Opening project: $SELECTED_PROJECT"
cd $SELECTED_PROJECT
zellij --layout ~/.config/zellij/layouts/def.kdl
