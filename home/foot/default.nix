{pkgs, ...}:
{
  programs.foot.settings = {
    main = {
      shell="fish";
      dpi-aware = "yes";
    };
  };
}
