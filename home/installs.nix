{ config, inputs, pkgs, ... }: 

{

    home.packages = with pkgs; [
        helix


# Managing Scripts for now 
        (pkgs.writeShellScriptBin "pf" ''
#!/usr/bin/env bash
         PROJECTS_DIR="$HOME/Documents/projects/"  # Change this to your actual projects directory
         SELECTED_PROJECT=$(find "$PROJECTS_DIR" -mindepth 1 -maxdepth 1 -type d | fzf --height 40% --reverse --prompt="Select a project: ")
         if [[ -z "$SELECTED_PROJECT" ]]; then
         echo "No project selected. Exiting."
         exit 1
         fi
         echo "Opening project: $SELECTED_PROJECT"
         cd $SELECTED_PROJECT
         zellij --layout ~/.config/zellij/layouts/def.kdl
         '')
    ];

}
