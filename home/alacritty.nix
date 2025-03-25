{ ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = 1;
    terminal.shell = "nu";

    window.padding = {
      x = 5;
      y = 5;
    };

    font = {
      normal.family = "JetBrainsMono Nerd Font";
      size = 13;
    };

    colors.primary = {
      background = "#222436";
      foreground = "#c8d3f5";
    };

    colors.normal = {
      black = "#1b1d2b";
      red = "#ff757f";
      green = "#c3e88d";
      yellow = "#ffc777";
      blue = "#82aaff";
      magenta = "#c099ff";
      cyan = "#86e1fc";
      white = "#828bb8";
    };

    colors.bright = {
      black = "#444a73";
      red = "#ff8d94";
      green = "#c7fb6d";
      yellow = "#ffd8ab";
      blue = "#9ab8ff";
      magenta = "#caabff";
      cyan = "#b2ebff";
      white = "#c8d3f5";
    };

  };
}
