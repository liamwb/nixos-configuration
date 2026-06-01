{
  programs.nixvim = {

    # Highlight, edit, and navigate code
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
    plugins.treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = false;
    };

    # disable for tex (VimTeX is better)
    extraConfigLua = ''
      vim.api.nvim_create_autocmd( 'FileType', { pattern = 'tex',
        callback = function(ev)
          vim.treesitter.stop(ev.buf)
          vim.bo[ev.buf].indentexpr = "VimtexIndentExpr()"
        end
      })
    '';
  };
}
