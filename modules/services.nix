{ pkgs, ... }:
{

  services.tlp.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.acpid.enable = true;

  services.picom = {
    enable = true;
    vSync = true;
  };

  services.xserver = {
    enable = true;

    windowManager = {
      leftwm.enable = true;
      spectrwm.enable = true;

      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gvfs.enable = true;
  services.displayManager.ly.enable = true;
}

