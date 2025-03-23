{ pkgs, config, ... }:

{
  programs.helix.enable = true;
  programs.helix.settings = {
    theme = "tokyonight_moon";
    editor = {
      line-number = "relative";
      lsp.display-messages = true;
      lsp.display-inlay-hints = true;
    };

    editor.indent-guides = {
      render = true;
      character = "▏";
      skip-levels = 1;
    };
  };
}
