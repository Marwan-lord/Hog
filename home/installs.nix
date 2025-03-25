{ pkgs, ... }:

{

  home.packages = with pkgs; [
    yt-dlp
    libnotify
    ffmpeg
    mpv
    gparted
    polkit
    polkit_gnome
    qalculate-gtk
    lua
    nodejs
    python3
    tlrc
    starship
    libclang
    ranger
    lf
    ghostty
    helix
    bacon
    lldb
    kitty
    eww
    nixd
    nixfmt-rfc-style
    tree
    xorg.xclock
    xorg.xprop
    swaylock
    swayimg
    fuzzel
    mako
    swww
    rofi-wayland
    # Managing Scripts for now
    (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
    (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
    (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
  ];

}
