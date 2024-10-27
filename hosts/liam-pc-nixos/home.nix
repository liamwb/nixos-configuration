{pc-background, ... }:

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

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${pc-background}"];
      wallpaper = [ 
      "DP-2,${pc-background}"
      "DP-3,${pc-background}"
      ];
    };
  };

  # set background for lock screen using custom option
  programs.hyprlock.backgroundImage = pc-background;

  # set the font size and shell for foot (per-host because I want different font sizes on different hosts)
  xdg.configFile."foot/foot.ini".text = ''
    # -*- conf -*-

    shell=fish
    font=monospace:size=12
  '';


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
