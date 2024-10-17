{config, pkgs, ...} :
{

  # This file controls system-wide options and packages that are common to all of my machines

  imports = [
    ./rofi-wifi-menu/rofi-wifi-menu.nix
    ./system-packages.nix
    ./steam.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # configure  firefox
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.plasma-browser-integration ];  
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };


  # fonts that support chinese 
  fonts.packages = with pkgs; [noto-fonts noto-fonts-extra noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-emoji];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  ######### Security #########

  # enable polkit so i can save as sudo in hyprland
  security.polkit.enable = true;

  # gnome-keyring services
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  programs.seahorse.enable = true;

  # enable hyprlock to perform authentication
  security.pam.services.hyprlock = {};
  ######### End Security ########

  # Input manager
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-chinese-addons  ];
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;  # provides blueman-applet and blueman-manager

  # configure fish
  programs.fish = {
    enable = true;
  };

  # List services that you want to enable:

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

}
