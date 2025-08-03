{ pkgs, inputs, ... }:
{
  
  environment.systemPackages = with pkgs; [
  wget
  libsmbios
  clinfo  # something about openCL / gpus
  libsmbios  # dell fan control 
  tree
  gparted
  devenv
  nix-search-cli
  protonup
  openssl

  # android tools
  android-tools
  heimdall
  heimdall-gui

  # rust
  rustc
  cargo
  cargo-generate
  pkg-config
  lldb  # debug adapter

  # for lilypad-suite
  lilypond-with-fonts
  mpv
  fluidsynth
  soundfont-fluid
  ffmpeg_7-full

  # things I needed to install to get nvim.kickstart working
  gcc
  unzip
  gnumake
  ripgrep
  luajitPackages.luarocks
  lua
  tree-sitter
  cargo
  go
  kdePackages.okular
  nautilus
  evince  # for thumbnails in nautilus

  inputs.ignis.packages.${system}.ignis
  ];

  # option for devenv
  nix.extraOptions = ''
        trusted-users = root liamwb
    '';
}
