{pkgs, ...}:
{
  programs.nixvim = {
    # Shows how to use the DAP plugin to debug your code.
    #
    # Primarily focused on configuring the debugger for Go, but can
    # be extended to other languages as well. That's why it's called
    # kickstart.nixvim and not ktichen-sink.nixvim ;)
    # https://nix-community.github.io/nixvim/plugins/dap/index.html
    plugins.dap = {
      enable = true;

      extensions = {
        # Creates a beautiful debugger UI
        dap-ui = {
          enable = true;

          # Set icons to characters that are more likely to work in every terminal.
          # Feel free to remove or use ones that you like more! :)
          # Don't feel like these are good choices.
          icons = {
            expanded = "▾";
            collapsed = "▸";
            current_frame = "*";
          };

          controls = {
            icons = {
              pause = "";
              play = " <F5>";
              step_into = " <F1>";
              step_over = " <F2>";
              step_out = " <F3>";
              step_back = "";
              run_last = "";
              terminate = "";
              disconnect = "";
            };
          };
        };

        dap-virtual-text.enable = true;

        # Add your own debuggers here
        dap-go = {
          enable = true;
        };

        dap-python = {
          enable = true;
        };
      };

      adapters = {
        executables = { lldb = {command = "${pkgs.lldb}/bin/lldb-dap"; }; };
      };
      # Unfortunately this does not work, since I can't work out how to get the `program` field to be written as a function instead of a string. Some extraConfigLua is required instead.

      # configurations = {
      #   rust = [{
      #     name = "Launch debugger";
      #     type = "lldb";
      #     request = "launch";
      #     program = '' 
      #         function()
      #           return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
      #         end,
      #       '';
      #   }];
      # };
    };


    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Original debug shortcuts
      {
        mode = "n";
        key = "<F5>";
        action.__raw = ''
          function()
            require('dap').continue()
          end
        '';
        options = {
          desc = "Debug: Start/Continue";
        };
      }
      {
        mode = "n";
        key = "<F1>";
        action.__raw = ''
          function()
            require('dap').step_into()
          end
        '';
        options = {
          desc = "Debug: Step Into";
        };
      }
      {
        mode = "n";
        key = "<F2>";
        action.__raw = ''
          function()
            require('dap').step_over()
          end
        '';
        options = {
          desc = "Debug: Step Over";
        };
      }
      {
        mode = "n";
        key = "<F3>";
        action.__raw = ''
          function()
            require('dap').step_out()
          end
        '';
        options = {
          desc = "Debug: Step Out";
        };
      }
      # Alternate debug keybinds because my laptop's function keys are borked
      {
        mode = "n";
        key = "<leader>gs";
        action.__raw = ''
          function()
            require('dap').continue()
          end
        '';
        options = {
          desc = "Debug: Start/Continue";
        };
      }
      {
        mode = "n";
        key = "<leader>gi";
        action.__raw = ''
          function()
            require('dap').step_into()
          end
        '';
        options = {
          desc = "Debug: Step Into";
        };
      }
      {
        mode = "n";
        key = "<leader>go";
        action.__raw = ''
          function()
            require('dap').step_over()
          end
        '';
        options = {
          desc = "Debug: Step Over";
        };
      }
      {
        mode = "n";
        key = "<leader>gu";
        action.__raw = ''
          function()
            require('dap').step_out()
          end
        '';
        options = {
          desc = "Debug: Step Out";
        };
      }
      # Breakpoints
      {
        mode = "n";
        key = "<leader>b";
        action.__raw = ''
          function()
            require('dap').toggle_breakpoint()
          end
        '';
        options = {
          desc = "Debug: Toggle Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>B";
        action.__raw = ''
          function()
            require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end
        '';
        options = {
          desc = "Debug: Set Breakpoint";
        };
      }
      # Toggle to see last session result. Without this, you can't see session output
      # in case of unhandled exception.
      {
        mode = "n";
        key = "<F7>";
        action.__raw = ''
          function()
            require('dapui').toggle()
          end
        '';
        options = {
          desc = "Debug: See last session result.";
        };
      }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraconfiglua#extraconfiglua
    extraConfigLua = ''
      require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
      require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
      require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
      require("dap-python").setup("python3")
    '';
    # See https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#usage
    # Following the "installed globally" instructions works when using `nix develop` or `nix-shell` for managing python dependencies
  };
}
