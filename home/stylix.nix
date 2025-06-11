{ pkgs, ... }:
{

  stylix.enable = true;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
  stylix.image = ../wallpapers/backtonature.jpg;
  stylix.polarity = "dark";

  stylix.fonts = {
    sizes.terminal = 14;
    monospace = {
      package = pkgs.nerd-fonts.ubuntu-mono;
      name = "UbuntuMono Nerd Font";
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
