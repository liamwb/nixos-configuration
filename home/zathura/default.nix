{config, pkgs, ...}:
{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      # recolor-keephue = true;
      # COOURS MANAGED BY STYLIX
      # recolor-darkcolor = "#F0F0F0";
      # recolor-lightcolor = "#101010";
      # highlight-color = "rgba(55, 12, 38, .4)";
      # highlight-active-color = "rgba(55, 12, 38, .4)";
    };
  };
}
