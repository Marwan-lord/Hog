# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


	# Graphics and drivers

  hardware.graphics = {
  		  enable = true;
		  extraPackages = with pkgs; [
			  intel-media-driver      # For Intel HD/UHD graphics (Broadwell+)
			  vaapiIntel              # VA-API (Video Acceleration) support
			  libvdpau-va-gl          # VDPAU (Video Decode) backend for VA-API
			  mesa.drivers            # OpenGL/Vulkan drivers
			  vpl-gpu-rt
		  ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.tlp.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
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
  services.pipewire = {
  	enable = true;
	pulse.enable = true;
  };

  services.acpid.enable = true;
  services.picom.enable = true;
  services.picom.vSync = true;
  services.picom.fade = true;
  services.picom.fadeDelta = 5;
  programs.slock.enable = true;


  # LeftWM
services.xserver.windowManager.leftwm.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gvfs.enable = true;
  services.xserver = {
	enable = true;
	windowManager.awesome = {
		enable = true;
		luaModules = with pkgs.luaPackages; [ luarocks luadbi-mysql ];
	};
};
services.displayManager = {
	sddm.enable = true;
	defaultSession = "none+awesome";
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marwan = {
    isNormalUser = true;
    description = "Marwan";
    extraGroups = [ "networkmanager" "wheel" ];
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
	];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
  ];
  environment.sessionVariables = {
  	EDITOR="vim";
};

  fonts.packages = [
    pkgs.nerd-fonts.zed-mono
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.lilex
    pkgs.nerd-fonts.space-mono
    pkgs.nerd-fonts.droid-sans-mono
  ];

  environment.shells = with pkgs; [ zsh ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
