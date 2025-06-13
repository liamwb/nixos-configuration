{ pkgs, ... }:

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
    ./rofi
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
  xdg = {
    desktopEntries = {
      handle-textedit = {
        name = "TextEdit Handler";
        exec = "handle-textedit %U";
        categories = [ "Application" ];
        mimeType = [ "x-textedit-handlet/textedit" ];
        };
    };

    mimeApps.defaultApplications = {
      "application/pdf" = [ "zathura.desktop" ];
      "x-textedit-handlet/textedit" = [ "q" ];
    };
  };

  home.sessionVariables = {
    LYEDITOR= "nvr -s +:'dr %(file)s | call cursor(%(line)s,%(char)s+1)'";
  };

  # disable stylix for waybar since I have a custom module
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.hyprlock.enable = false;

  home.packages = with pkgs; [
    firefox
    chromium
    thunderbird
    zotero 
    sage
    youtube-music

    fish # friendly shell
    nerdfonts # nerd fonts for pretty shell
    starship # terminal customisation
    foot  # terminal emulator
    #  steam don't include in phd machine so move to per-machine
    discord
    fastfetch
    pokeget-rs  # important for drip
    lsd # ls with icons
    teams-for-linux
    onedrive
    openvpn
    android-studio
    texlive.combined.scheme-full
    inkscape  # required for including svgs in latex documents
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
    bat  # cat but with colours
    dust  # disk usage terminal utility
    # ncspot  # terminal spotify client (requires premium)
    porsmo  # terminal pomodoro timer
    wiki-tui  # wikipedia tui
    tldr  # tldr for man pages
    obs-studio
    zathura  # pdf viewer
    feh  # image viewer
    base16-schemes  # collection of colour schemes
    bottom  # perfomance info
    warp-terminal  # grant's malware
    smassh  # monkeytype tui
    libreoffice-qt6-still  # libreoffice that doesn't look like shite
    telegram-desktop
    easyeffects
  
    # neovim
    luajitPackages.jsregexp  # dependency for LuaSnips
    fd  # like find, nvim wants it
    neovim-remote  # nvr for point-and-click with lilypond-suite
    nil  # nix language server for nix ide    
    nvd

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

    gnome-keyring
    seahorse
    libsecret
  ];

  home.shellAliases = {
    ls = "lsd";
  };

}
