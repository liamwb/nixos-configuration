{pkgs, ...}:
{
  # cursor settings
  home.pointerCursor = {
    gtk.enable = true;
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
