{pkgs, laptop-background, ... }:

{
  imports = [
    ./../../home/default.nix
  ];

  home.packages = with pkgs; [
    steam
  ];
  
  wayland.windowManager.hyprland.settings = {
    monitor =[
    "eDP-1,1920x1080@60,0x0,1"
    " , preferred, auto, 1"  # add other monitors to the right at default res
    ];

  };

  stylix = {
    targets = {
      # zathura.enable = false;
      kde.enable = false;
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${laptop-background}"];
      wallpaper = [ "eDP-1,${laptop-background}"];
    };
  };

  # set background for lock screen using custom option
  programs.hyprlock.backgroundImage = laptop-background;

  # set the font size and shell for foot (per-host because I want different font sizes on different hosts)
  xdg.configFile."foot/foot.ini".text = ''
    # -*- conf -*-

    shell=fish
    font=IntoneMono NFP:size=14
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
