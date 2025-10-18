{
programs.nixvim = {
    plugins.vim-matchup = {
      enable = true;

      settings = {
        surround_enabled = 1;
        matchparen_deferred_hi_surround_always = true;
        matchparen_deferred = 1;
      };
      treesitter.enable = true;
    };

  extraConfigLua = ''
    vim.g.matchup_override_vimtex = 1
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ly",
      callback = function()
        vim.opt_local.matchpairs:append("<:>")
        vim.b.matchup_matchparen_enabled = 1
        vim.b.matchup_delim_noskips = "<>"
      end,
    })
  '';
  };
}
