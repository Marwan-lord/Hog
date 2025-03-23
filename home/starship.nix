{ ... }:
{
  programs.starship.enable = true;
  programs.starship.settings = {
    battery = {
      format = "[$symbol$percentage]($style) ";
      charging_symbol = "󰂐 ";
      discharging_symbol = "󱧥 ";
      empty_symbol = " ";
      full_symbol = " ";
      unknown_symbol = "󰂑 ";
      disabled = false;
      display = [
        {
          style = "red bold";
          threshold = 10;
        }
      ];
    };
  };
}
