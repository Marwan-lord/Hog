{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./services.nix
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Intel HD/UHD graphics (Broadwell+)
      vaapiIntel # VA-API (Video Acceleration) support
      libvdpau-va-gl # VDPAU (Video Decode) backend for VA-API
      mesa.drivers # OpenGL/Vulkan drivers
      vpl-gpu-rt
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts.fontconfig.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  programs.slock.enable = true;
  security.polkit.enable = true;

  users.users.marwan = {
    isNormalUser = true;
    description = "Marwan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      zathura
      lazygit
      zellij
      rustup
      fastfetch
      go
      ppsspp
      dunst
      fzf
      btop
      gdb
      cmake
      hexyl
      tldr
      unzip
      gnumake
      ccls
      bat
      htop
      man-pages
      man-pages-posix
      clang
      gopls
      wezterm
      upower
      discord-ptb
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    alacritty
    chromium
    yazi
    pcmanfm
    feh
    xclip
    neovim
    gcc
    jq
    ripgrep
    fd
    vlc
    xdotool
    xorg.xrandr
    pipewire
    pwvucontrol
    pw-volume
    pavucontrol
    home-manager
    brightnessctl
    nasm
    pkg-config
  ];

  environment.sessionVariables = {
    EDITOR = "vim";
    PKG_CONFIG_PATH = "${pkgs.fontconfig}/lib/pkgconfig";
  };

  fonts.packages = [
    pkgs.nerd-fonts.zed-mono
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.lilex
    pkgs.nerd-fonts.space-mono
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.go-font
    pkgs.font-awesome
  ];

  environment.shells = with pkgs; [ zsh ];
  system.stateVersion = "24.11";

}
