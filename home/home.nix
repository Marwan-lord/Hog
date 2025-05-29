{ ... }:

{
  imports = [
    ./installs.nix
    ./starship.nix
    ./sh.nix
    ./helix.nix
    ./alacritty.nix
    ./foot.nix
    ./fuzzel.nix
    ./tools/zellij.nix
    ./zathura.nix

    ./tools/bat.nix
    ./tools/mako.nix
    ./tools/hyprlock.nix
    ./tools/fzf.nix
  ];

  home.username = "marwan";
  home.homeDirectory = "/home/marwan";
  home.stateVersion = "24.11";
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
