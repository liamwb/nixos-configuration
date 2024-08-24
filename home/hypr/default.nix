{config, pkgs, ...}:
{
  imports = [
    ./hyprland.nix
  ];
  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf; 
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf; 
  # home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf; 

}
