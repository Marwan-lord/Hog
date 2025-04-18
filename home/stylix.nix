{ pkgs, ... }:
{

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
  stylix.image = ../wallpapers/redd.jpg;
  stylix.polarity = "dark";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
  };
}
