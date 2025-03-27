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
    ranger
    lf
    helix
    bacon
    lldb
    kitty
    eww
    nixd
    nixfmt-rfc-style
    tree
    swaylock
    swayimg
    fuzzel
    mako
    swww
    rofi-wayland
    jetbrains.idea-community
    dmenu-wayland
    foot
    nwg-look
    ppsspp
    waybar
    librewolf-wayland
    ttyper
    mgba
    

    # Managing Scripts for now
    (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
    (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
    (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
  ];

}
