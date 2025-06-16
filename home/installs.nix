{ pkgs, ... }:

{

  home.packages = with pkgs; [
    yt-dlp
    libnotify
    ffmpeg
    celluloid
    xine-ui
    qalculate-gtk
    lua
    nodejs
    python3
    tlrc
    starship
    libclang
    lf
    helix
    bacon
    lldb
    nixd
    nixfmt-rfc-style
    tree
    fuzzel
    mako
    swww
    dmenu-wayland
    foot
    nwg-look
    waybar
    ttyper
    qview
    smassh
    gtypist
    nitch
    krita
    anki
    p7zip
    zoxide
    hyprpicker
    php
    php84Packages.composer
    sqlite
    superhtml
    wineWowPackages.waylandFull
    kdePackages.kate
    ddgr
    lshw
    cargo
    rustc
    rustfmt
    clippy
    tgpt
    swaybg
    rusty-man
    blanket
    eww
    spaceFM
    nh

    # Managing Scripts for now
    (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
    (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
    (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
  ];

}
