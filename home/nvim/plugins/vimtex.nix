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

        syntax_conceal = {
          accents = 0;
          cites = 1;
          fancy = 1;
          greek = 1;
          ligatures = 1;
          math_delimiters = 1;
          math_super_sub = 0;
          math_symbols = 1;
          spacing = 0;
          styles = 1;
          math_bounds = 0;
          math_fracs = 0;
          sections = 0;
        };
      };
    };

  };
}
