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
        nodejs
        python3
        polybar
        tlrc
        xsel
        lxappearance
        starship
        libclang
        ranger
        lf
        rofi
        librewolf
        jetbrains.idea-community
        ghostty
        # Managing Scripts for now 
        (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
        (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
        (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
    ];

}
