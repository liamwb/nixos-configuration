{
  programs.nixvim = {
    # Useful plugin to show you pending keybinds.
    # https://nix-community.github.io/nixvim/plugins/which-key/index.html
    plugins.which-key = {
      enable = true;

      # Document existing key chains
      settings.spec = [
        { lhs = "<leader>c";
          name = "[C]ode";
          hidden = true;
        }
        { lhs = "<leader>d";
          name = "[D]ocument";
          hidden = true;
        }
        { lhs = "<leader>r";
          name = "[R]ename";
          hidden = true;
        }
        { lhs = "<leader>s";
          name = "[S]earch";
          hidden = false;
        }
        { lhs = "<leader>w";
          name = "[W]orkspace";
          hidden = false;
        }
        { lhs = "<leader>t";
          name = "[T]oggle";
          hidden = true;
        }
        { lhs = "<leader>h";
          name = "Git [H]unk";
          hidden = false;
        }
        {
          lhs = "<leader>g";
          name = "Debug";
          hidden = false;
        }
      ];
    };
  };
}
