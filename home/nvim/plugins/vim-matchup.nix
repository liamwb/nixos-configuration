{
programs.nixvim = {
    plugins.vim-matchup = {
      enable = true;
      enableSurround = true;

      matchParen = {
        hiSurroundAlways = true;  # highlight surrounding delimiters always (requires deferred highlighting)
        deferred.enable = true;
      };

    treesitterIntegration.enable = true;
    };
  };

  extraConfigLua = "vim.g.matchup_override_vimtex = 1";
}
