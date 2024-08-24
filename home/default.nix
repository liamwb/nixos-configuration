{ config, pkgs, ... }:

{

  # This file controls all the home-manager stuff that is common to all my machines.
  imports = [
    ./hypr
    ./fish
    ./nvim
    ./zathura
    ./wlogout
    ./foot
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamwb";
  home.homeDirectory = "/home/liamwb";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "liamwb";
    userEmail = "liam.woodbaker@gmail.com";
  };

  home.packages = with pkgs; [
    firefox
    chromium
    thunderbird
    libsForQt5.qmltermwidget
    fish # friendly shell
    nerdfonts # nerd fonts for pretty shell
    starship # terminal customisation
    foot  # terminal emulator
    steam
    discord
    gotop # pretty system utilisation via console
    neofetch
    lf # terminal file manager
    lsd # ls with icons
    teams-for-linux
    onedrive
    openvpn
    android-studio
    texlive.combined.scheme-full
    cava # music visualisation
    nvtopPackages.full # gpu utilisation info
    fzf
    xclip
    wl-clipboard
    vlc
    slack
    jellyfin-media-player
    zoom
    yazi
    obs-studio
    zathura
    base16-schemes  # collection of colour schemes
    abiword
  
    luajitPackages.jsregexp  # dependency for LuaSnips
    fd  # like find, nvim wants it

    # packages for hyprland
    kitty
    hyprland
    waybar
    rofi-wayland # up launcher
    networkmanagerapplet
    hyprpaper
    brightnessctl # for screen brightness
    blueman #  bluetooth
    pavucontrol # auio controller?
    hypridle
    hyprlock
    mako
    libnotify
    wlogout
    grimblast
    xwaylandvideobridge

    # kde packages 
    kdePackages.dolphin
  ];

  home.shellAliases = {
    ls = "lsd";
  };

}
