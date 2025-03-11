{ config, pkgs, ... }:

{
    imports = [
        ./installs.nix
        ./starship.nix
        ./sh.nix
    ];

    home.username = "marwan";
    home.homeDirectory = "/home/marwan";
    home.stateVersion = "24.11";
    home.sessionVariables = {
        EDITOR = "vim";
    };

    programs.home-manager.enable = true;
}
