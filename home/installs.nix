{ pkgs, ... }:

{

  home.packages = with pkgs; [
    yt-dlp
    libnotify
    ffmpeg
    mpv
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
    swaylock
    fuzzel
    mako
    swww
    dmenu-wayland
    foot
    nwg-look
    ppsspp
    waybar
    librewolf-wayland
    ttyper
    mgba
    nautilus
    qview
    smassh
    gtypist
    # Managing Scripts for now
    (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
    (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
    (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
  ];

}
