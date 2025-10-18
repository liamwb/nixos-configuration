{
programs.nixvim = {
    plugins.vim-surround = {
      enable = true;
    };

  extraConfigLua = "vim.g.matchup_override_vimtex = 1";
  };
}
