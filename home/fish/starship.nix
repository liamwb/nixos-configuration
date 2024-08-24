{config, pkgs, lib, ...}:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = lib.importTOML ./starship.toml;
  };
}
