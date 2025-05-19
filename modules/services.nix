{ ... }:
{

  services.tlp.enable = true;
  systemd.user.extraConfig = "DefaultTimeoutStopSec=5s";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  services.upower.enable = true;
  services.acpid.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gvfs.enable = true;
  services.displayManager.ly.enable = true;
}
