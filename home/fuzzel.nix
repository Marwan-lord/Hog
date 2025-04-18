{ pkgs, ... }: {
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      terminal = "${pkgs.foot}/bin/foot";
      layer = "overlay";
    };
  };
}
