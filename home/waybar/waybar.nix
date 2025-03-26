{ ...}:

{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "left";
      height = 1080;
      width = 12;

      modules-left = [
        "custom/menu"
        "mpd"
      ];

      modules-center = [
        "niri/workspaces"
      ];

      modules-right = [
        "tray"
        "pulseaudio"
        "clock"
        "battery"
      ];

      "niri/workspaces" = {
        disable-scroll = true;
        active-only = false;
        all-outputs = true;
        wrap-on-scroll = false;
        on-click = "activate";
        format = "{icon}";
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
        };
        format-icons =  {
          empty =  " ";
          default =  " ";
          active =  " ";
          urgent =  " ";
        };
      };

      "tray" = {
        icon-size = 16;
        spacing = 10;
      };

      "battery" = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };

        format =            "{capacity}% {icon}";
        format-full =       "{icon} {capacity}% ";
        format-charging =   "{capacity}%";
        format-plugged =    " {capacity}% ";
        format-alt =        "{time} {icon}";
        format-icons  = ["" "" "" ""  ""];

      };

      "clock" =  {
        interval =  1;
        format  = "{:%I:%M %p}";
        tooltip-format =  "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll =  1;
          format  = {
            months =  "<span color='#ffead3'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks =  "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays =  "<span color='#ffcc66'><b>{}</b></span>";
            today =  "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
      };

      "pulseaudio" =  {
        format = "{icon} {volume}%";
        format-muted = "Muted";
        format-source = "{volume}%";
        format-source-muted =  "";
        format-icons =  {
          default =  ["󰕿" "󰖀" "󰕾"];
        };
        on-click-right = "pavucontrol";
      };

    #   "custom/menu" =  {
    #     format =  " ";
    #     tooltip =  false;
    #     menu = "on-click";
    #     menu-file = "$HOME/.config/waybar/power_menu.xml";
    #     menu-actions = { 
    #       shutdown = "poweroff";
    #       reboot = "reboot";
    #       suspend = "systemctl suspend";
    #       hibernate =  "systemctl hibernate";
    #     };
    #   };
    };
  };
  programs.waybar.style = ./style.css;
}
