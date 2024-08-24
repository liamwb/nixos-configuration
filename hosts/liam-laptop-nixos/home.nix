{ config, pkgs, ... }:

{
  imports = [
    ./../../home/default.nix
  ];
  
  wayland.windowManager.hyprland.settings = {
    monitor =[
    "eDP-1,3840x2160@60,0x0,2"
    ];

    env = [
      "QT_AUTO_SCREEN_SCALE_FACTOR = 2"
      "GDK_SCALE,2"
    ];  # 2x scaling for 4k laptop
  };

  stylix = {
    targets = {
      # zathura.enable = false;
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

}
