{
  programs.nixvim = {
    # Add indentation guides even on blank lines
    # For configuration see `:help ibl`
    # https://nix-community.github.io/nixvim/plugins/indent-blankline/index.html
    plugins.indent-blankline = {
      enable = true;

      settings = {
        # indent-blankline seems to cause slowdowns with tex documents
        exclude = {
          filetypes = [ "tex" "latex" ];
        };
      };
    };
  };
}
