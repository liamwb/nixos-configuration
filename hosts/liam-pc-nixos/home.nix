{lib, ... }:

{
  imports = [
    ./../../home/default.nix
  ];
  
  wayland.windowManager.hyprland.settings = {
    monitor = [
    "DP-3, 1920x1080@165, 0x0, 1"
    "DP-2, 1920x1080@60, 1920x0, 1"
    ];

    input = {
      sensitivity = -0.5;
    };

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
