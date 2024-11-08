# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, laptop-background, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./../../common/default.nix
      ./nvidia.nix
      ./windows-partition.nix
      ./power-man.nix
    ];


  users.users.liamwb = {
    isNormalUser = true;
    description = "my default user";
    extraGroups = [ "networkmanager" "wheel" "storage" ];
    shell = pkgs.fish;
  };

  # enable stylix
  stylix = {
    enable = true;
    image = laptop-background;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };

  # theme for SDDM
  environment.systemPackages = [
    (pkgs.where-is-my-sddm-theme.override {
      themeConfig.General = {
        # background = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        # backgroundMode = "none";
        showSessionsByDefault = "true";
      };
    })
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "liam-laptop-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # turn of wifi power saving
  networking.networkmanager.wifi.powersave = false;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ######### Enable SDDM, KDE, Hyprland ###########
  services.xserver.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    extraPackages = with pkgs; [ qt6.qt5compat ];
    theme = "where_is_my_sddm_theme";
  };
  # services.xserver.desktopManager.plasma5.enable = true;
  programs.hyprland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];

  ######### End SDDM, KDE, Hyprland ###########

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

  # Enable automatic login for the user.
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "liamwb";

  # fingerprint reader
  services.fprintd.enable = true;

  # firmware upgrades
  services.fwupd.enable = true;

  # enable automated garbage collection

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Fix git freezing the system
  # programs.ssh = {
  #   enableAskPassword = true;
  #   askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
  # };
  #
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 29999 ];
  # networking.firewall.allowedUDPPorts = [ 29999 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
