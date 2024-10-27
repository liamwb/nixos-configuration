{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix 
  ];
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf; 
  # home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

  programs.hyprlock.enable = true;
  # Note that PAM must be configured to enable hyprlock to perform authentication. The package installed through home-manager will not be able to unlock the session without this configuration.
  #
  # On NixOS, it can be enabled using:
  #
  # security.pam.services.hyprlock = {};

}
