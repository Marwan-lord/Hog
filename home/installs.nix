{ config, inputs, pkgs, ... }: 

{

    home.packages = with pkgs; [
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
        jetbrains.idea-community
        ghostty
        helix
        bacon
        lldb
        flameshot
        kitty

        # Managing Scripts for now 
        (writeShellScriptBin "pf" (builtins.readFile ../scripts/finder.sh))
        (writeShellScriptBin "bf" (builtins.readFile ../scripts/books.sh))
        (writeShellScriptBin "yf" (builtins.readFile ../scripts/yt.sh))
    ];

}
