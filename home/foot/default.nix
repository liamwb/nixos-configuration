{pkgs, ...}:
{
  programs.foot.settings = {
    main = {
      dpi-aware = "yes";
      font = "Fira Code:size=16";
    };
  };
}
