{ config, pkgs, ... }:

{

  # This file controls all the home-manager stuff that is common to all my machines.
  imports = [
    ./hypr
    ./fish
    ./nvim
    ./zathura
    ./wlogout
    ./yazi.nix
    ./waybar
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
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

  # set default applications
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
  };

  home.packages = with pkgs; [
    firefox
    chromium
    thunderbird
    fish # friendly shell
    nerdfonts # nerd fonts for pretty shell
    starship # terminal customisation
    foot  # terminal emulator
    steam
    discord
    fastfetch
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
    yazi  # terminal file manager
    obs-studio
    zathura  # pdf viewer
    feh  # image viewer
    base16-schemes  # collection of colour schemes
    softmaker-office
    bottom  # perfomance info
    warp-terminal  # grant's malware
    smassh  # monkeytype tui
    libreoffice-qt6-still  # libreoffice that doesn't look like shite
  
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

    gnome.gnome-keyring
    gnome.seahorse
    libsecret
  ];

  home.shellAliases = {
    ls = "lsd";
  };

}
