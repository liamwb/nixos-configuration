{ pkgs, inputs, ... }:
{
  
  environment.systemPackages = with pkgs; [
  wget
  libsmbios
  clinfo  # something about openCL / gpus
  libsmbios  # dell fan control 
  tree
  gparted
  vscode
  (python311.withPackages(ps: with ps; [ 
    networkx 
    matplotlib 
    numpy 
    notebook 
    pynvim 
    progress 
    tqdm 
    debugpy
    ]))
  nix-search-cli
  protonup
  nil  # nix language server for nix ide    
  nvd

  # android tools
  android-tools
  heimdall
  heimdall-gui

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
}
