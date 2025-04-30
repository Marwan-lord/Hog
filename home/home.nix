{ ... }:

{
  imports = [
    ./installs.nix
    ./starship.nix
    ./sh.nix
    ./helix.nix
    ./alacritty.nix
    ./hyprlock.nix
    ./mako.nix
    ./foot.nix
    ./fuzzel.nix
    ./zellij.nix
    ./zathura.nix
    ./bat.nix
    ./fzf.nix
  ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "24.11";
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
