{ pkgs, inputs,  ... }:
{

  services.tlp.enable = true;
  systemd.user.extraConfig = "DefaultTimeoutStopSec=5s";


  system.autoUpgrade = {
  enable = true;
  flake = inputs.self.outPath;
  flags = [
    "--update-input"
    "nixpkgs"
    "-L" # print build logs
  ];
  dates = "02:00";
  randomizedDelaySec = "45min";
};

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.acpid.enable = true;

  services.xserver = {
    enable = true;
    windowManager = {
      leftwm.enable = true;
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gvfs.enable = true;
  services.displayManager.ly.enable = true;
}

