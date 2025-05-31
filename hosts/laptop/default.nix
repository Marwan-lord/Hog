{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/services.nix
    ../../modules/niri.nix
    ../../home/stylix.nix
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Intel HD/UHD graphics (Broadwell+)
      vaapiIntel # VA-API (Video Acceleration) support
      libvdpau-va-gl # VDPAU (Video Decode) backend for VA-API
      mesa # OpenGL/Vulkan drivers
      intel-media-sdk
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

  programs.nix-ld.enable = true;

  fonts.fontconfig.enable = true;
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
      vesktop
      intelephense
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
    (chromium.override {
      commandLineArgs = [
        "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
      ];
    })

    yazi
    pcmanfm
    neovim
    gcc
    jq
    ripgrep
    fd

    pipewire
    pwvucontrol
    pw-volume
    pavucontrol
    home-manager
    brightnessctl
    nasm
    pkg-config
    kitty
    foot
    lutris
  ];

  environment.sessionVariables = {
    EDITOR = "vim";
  };

  fonts.packages = [
    pkgs.nerd-fonts.zed-mono
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.lilex
    pkgs.nerd-fonts.space-mono
    pkgs.nerd-fonts.ubuntu-mono
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.go-font
    pkgs.font-awesome
  ];

  environment.shells = with pkgs; [ zsh ];
  system.stateVersion = "24.11";

}
