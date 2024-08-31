{ config, pkgs, lib, ... }:
{
  
  environment.systemPackages = with pkgs; [
  wget
  libsmbios
  clinfo  # something about openCL / gpus
  libsmbios  # dell fan control 
  tree
  gparted
  libsForQt5.qt5ct
  libsForQt5.qtstyleplugin-kvantum
  libsForQt5.bismuth
  libsForQt5.qt5.qtwayland
  libsForQt5.kwallet
  libsForQt5.kwalletmanager
  vscode
  (python311.withPackages(ps: with ps; [ networkx matplotlib numpy notebook pynvim progress tqdm ]))
  nix-search-cli
  protonup
  nil  # nix language server for nix ide    
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
  ];
}
