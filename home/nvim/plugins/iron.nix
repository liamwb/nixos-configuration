{pkgs, ...}:
{

  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      iron-nvim
    ];

    # example config taken from the github
    extraConfigLua = ''
local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"fish"}
      },
      python = {
        command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').split.belowright(0.33),
    -- no line numbers for the interactive terminal
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<leader>ic",
    visual_send = "<leader>ic",
    send_file = "<leader>if",
    send_line = "<leader>il",
    send_paragraph = "<leader>ip",
    send_until_cursor = "<leader>iu",
    send_mark = "<leader>im",
    mark_motion = "<leader>mc",
    mark_visual = "<leader>mc",
    remove_mark = "<leader>md",
    cr = "<leader>i<cr>",
    interrupt = "<leader>i<leader>",
    exit = "<leader>iq",
    clear = "<leader>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
    '';


    plugins.which-key = {
      # Hints for iron
      settings.spec = [
        { 
          lhs = "<leader>i";
          name = "[I]nteractive";
        }
        { 
          lhs = "<leader>ic";
          name = "Send Motion";
        }
        { 
          lhs = "<leader>if";
          name = "Send File";
        }
        { 
          lhs = "<leader>il";
          name = "Send Line";
        }
        { 
          lhs = "<leader>ip";
          name = "Send Paragraph";
        }
        { 
          lhs = "<leader>iu";
          name = "Send Up To Cursor";
        }
        { 
          lhs = "<leader>im";
          name = "Send Mark";
        }
        { 
          lhs = "<leader>mc";
          name = "Mark Motion";
        }
        { 
          lhs = "<leader>md";
          name = "Delete Mark";
        }
        { 
          lhs = "<leader>s<leader>";
          name = "Interrupt";
        }
        { 
          lhs = "<leader>sq";
          name = "Quit";
        }
        { 
          lhs = "<leader>cl";
          name = "Clear";
        }
      ];
    };
  };
}
