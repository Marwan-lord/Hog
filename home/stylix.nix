{ pkgs, ... }:
{

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gotham.yaml";
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
      package = pkgs.ubuntu-sans;
      name = "Ubuntu Sans";
    };
  };
}
