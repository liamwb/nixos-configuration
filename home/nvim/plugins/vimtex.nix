{pkgs, ...}:
{
  programs.nixvim = {
    plugins.vimtex = {
      enable = true;

      texlivePackage = pkgs.texlive.combined.scheme-full;
      settings = {
        matchparen_enabled = 0;  # vimtex built in pathenthesis matchin is very slow

        delim_timeout = 10;  # set the timeout for fancy bracket matching to 100ms
        delim_stopline = 50;

        quickfix_mode = 0;  # don't open the quick fix menu by default

        indent_on_ampersands = 0;  # can't believe anyone wants this

        view_method = "zathura";
      };
    };

  };
}
