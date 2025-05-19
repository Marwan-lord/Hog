{ ... }:
{
  services.mako = {
    enable = true;
    settings = {
      format = "<b>%s</b>\\n%b";
      sort = "-time";
      layer = "overlay";
      anchor = "top-center";
      width = 300;
      padding = "10";
      border-size = 2;
      border-radius = 16;
      icons = true;
      default-timeout = 5000;
      ignore-timeout = false;
    };
  };
}
