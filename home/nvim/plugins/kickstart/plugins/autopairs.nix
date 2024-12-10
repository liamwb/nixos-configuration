{
  # Inserts matching pairs of parens, brackets, etc.
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html
  programs.nixvim = {
    plugins.nvim-autopairs = {
      enable = true;

      settings = {
        check_ts = true;  # enable treesitter integration
# disable_filetype = [ "tex" ];
      };

    };
    # god this took so long to find the correct option for
    # see https://github.com/ryuryu-ymj/dev_config/blob/306b586cec68b5ff3e5e58efa8221361e16972f2/nvim/lua/plugins/coding.lua#L227
    extraConfigLua = ''
      local Rule = require('nvim-autopairs.rule')
      local npairs = require('nvim-autopairs')
      local cond = require('nvim-autopairs.conds')

      -- prevent nvim-autopairs from interfering with snippets
      npairs.get_rule('(')
          :with_pair(cond.not_before_text('@'))
      npairs.get_rule('[')
          :with_pair(cond.not_before_text('@'))
      npairs.get_rule('{')
          :with_pair(cond.not_before_text('@'))

      npairs.add_rule(
        Rule('<', '>', {'ly', 'lilypond'})
      )
        '';
  };
}
