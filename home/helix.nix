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
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        formatter = {
          command = "nixfmt";
        };
        auto-format = true;
      }

      {
        name = "rust";
        formatter = {
          command = "rustfmt";
        };
        auto-format = true;
      }
    ];
  };
}
