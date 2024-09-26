{pkgs, config, ...}:
{
  home.file.".config/waybar/config".source = ./config;
  programs.waybar = {
    enable = true;
  };
}
