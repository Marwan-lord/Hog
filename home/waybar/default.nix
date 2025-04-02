{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "right";
        width = 42;
        
        modules-left = [
          "niri/workspaces"
          "custom/separator"
        ];
        
        modules-right = [
          "pulseaudio"
          "battery"
          "clock"
        ];
        
        "niri/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
          "format-icons" = {
            "1" = "١";
            "2" = "٢";
            "3" = "٣";
            "4" = "٤";
            "5" = "٥";
            active = "★";
            default = "•";
          };
          "sort-by-number" = true;
        };
        
        "custom/separator" = {
          format = "─";
          interval = "once";
          tooltip = false;
        };
        
        pulseaudio = {
          format = "{icon}";
          "format-icons" = {
            default = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
        
        battery = {
          format = "{icon}";
          "format-icons" = ["󰁺" "󰁽" "󰁿" "󰂀" "󱈏"];
          "format-charging" = "󰂄";
          states = {
            warning = 30;
            critical = 15;
          };
        };
        
        clock = {
          format = "{:%H\n%M}";
          "tooltip-format" = "{:%Y-%m-%d}";
        };
      };
    };
  };

  programs.waybar.style = ./style.css;
}
