{ pkgs, ... }:
{
  # cursor settings
  home.pointerCursor = {
    enable = true;
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
