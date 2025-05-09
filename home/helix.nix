{ ... }:

{
  programs.helix.enable = true;
  programs.helix.settings = {
    editor = {
      line-number = "relative";
      lsp.display-messages = true;
      # lsp.display-inlay-hints = true;
    };
    editor.auto-completion = false;
    editor.color-modes = true;
    editor.cursorline = true;
    editor.bufferline = "multiple";

    editor.indent-guides = {
      render = true;
      character = "▏";
      skip-levels = 1;
    };
  };
}
