{ config, pkgs, lib, ... }:
let 
  alpacaAccel = pkgs.alpaca.override {
    ollama = pkgs.ollama-rocm;
  };
in
{

  imports = [ ./../../home/default.nix ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = lib.mkForce "phduser";  # all other machines the username is liamwb
  home.homeDirectory = lib.mkForce "/home/phduser";  # all other machines the directory is /home/liamwb

  # path fuckery for ubuntu + hyprland
  home.sessionPath = [
    "/nix/var/nix/profiles/default/bin"
    "/home/phduser/.nix-profile/bin"
  ];

  home.packages = [
    alpacaAccel
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config = {
	  allowUnfree = true;
  };


  # set the font size and shell for foot (per-host because I want different font sizes on different hosts)
  xdg.configFile."foot/foot.ini".text = ''
    # -*- conf -*-

    shell=fish
    font=monospace:size=12
  '';

  stylix = {
    enable = true;
    image = ./../../wallpapers/nord-rainbow-dark-nix.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "dark";
  };

  wayland.windowManager.hyprland.settings = {
    # the version of hyprland in apt for ubuntu does not support the decoration:shadow option
    decoration = lib.mkForce {};

    monitor =[
    "DP-6,1920x1080@60,0x0,1"
    "DP-5,1920x1080@60,1920x0,1"
    " , preferred, auto, 1"  # add other monitors to the right at default res
    ];

    env = [ 
      "PATH,/nix/var/nix/profiles/default/bin:/home/phduser/.nix-profile/bin:$PATH"
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
