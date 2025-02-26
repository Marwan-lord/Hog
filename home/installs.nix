{ config, inputs, pkgs, ... }: 

{

    home.packages = with pkgs; [
        helix
        yt-dlp
        dmenu
        libnotify
        ffmpeg
        mpv
        gparted
        polkit
        polkit_gnome
        qalculate-gtk
        krita
        lua
        # Managing Scripts for now 
        (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
        (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
        (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
    ];

}
