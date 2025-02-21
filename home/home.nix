{ config, pkgs, ... }:

{
    imports = [
        ./installs.nix
    ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
