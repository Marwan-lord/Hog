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
      disabled = true;
      display = [
        {
          style = "red bold";
          threshold = 10;
        }
      ];
    };
  };
}
